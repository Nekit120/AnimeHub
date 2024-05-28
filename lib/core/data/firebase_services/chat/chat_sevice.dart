import 'package:anime_hub/core/data/firebase_services/model/user_model_with_last_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/message_model.dart';
import '../model/user_model.dart';

class ChatFirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<UserModel>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshots) {
      return snapshots.docs.map((doc) {
        final users = doc.data();
        return UserModel.fromJson(users);
      }).toList();
    });
  }

// Stream<List<UserModelWithLastMessage>> getUserModelWithLastMessage({required String currentUserUid}) {
//     return _firestore.collection("Users").snapshots().map((snapshots) {
//       return snapshots.docs.map((doc) {
//         final users = UserModel.fromJson(doc.data());
//         List<String> ids = [currentUserUid, users.uid];
//         ids.sort();
//         String chatRoomId = ids.join("_");
//         final querySnapshot =  _firestore
//             .collection("chat_rooms")
//             .doc(chatRoomId)
//             .collection("messages")
//             .orderBy("timestamp",descending: false)
//             .get();
//
//          MessageModel.fromJson(querySnapshot.docs.first.data());
//         return UserModelWithLastMessage(uid: users.uid, email: users.email,username: users.username,phoneNumber: users.phoneNumber, profileImageUrl: users.profileImageUrl, lastMessage: '',);
//       }).toList();
//     });
//   }
  Stream<List<UserModelWithLastMessage>> getUserModelWithLastMessage({required String currentUserUid}) {
    return _firestore.collection("Users").snapshots().asyncMap((snapshots) async {
      List<UserModelWithLastMessage> userModelWithLastMessages = [];

      for (var doc in snapshots.docs) {
        final users = UserModel.fromJson(doc.data());
        List<String> ids = [currentUserUid, users.uid];
        ids.sort();
        String chatRoomId = ids.join("_");

        final querySnapshot = await _firestore
            .collection("chat_rooms")
            .doc(chatRoomId)
            .collection("messages")
            .orderBy("timestamp", descending: true)
            .limit(1)
            .get();

        String lastMessage = "";
        if (querySnapshot.docs.isNotEmpty) {
          lastMessage = MessageModel.fromJson(querySnapshot.docs.first.data()).message;
        }

        userModelWithLastMessages.add(UserModelWithLastMessage(
          uid: users.uid,
          email: users.email,
          username: users.username,
          phoneNumber: users.phoneNumber,
          profileImageUrl: users.profileImageUrl,
          lastMessage: lastMessage,
        ));
      }

      return userModelWithLastMessages;
    });
  }

  Future<void> sendMessage(
      {required String receiverID, required String message}) async {
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    final newMessage = MessageModel(
        senderID: currentUserId,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp);

    List<String> ids = [currentUserId, receiverID];
    ids.sort();
    String chatRoomId = ids.join("_");
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toJson());
  }


  Stream<QuerySnapshot> getMessage(
      {required String userId, required String otherUserId}) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        // .limitToLast(140)
        .snapshots();
  }

  Future<MessageModel?> getLastMessage(
      {required String userId, required String otherUserId}) async {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    final querySnapshot = await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp",descending: false)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return MessageModel.fromJson(querySnapshot.docs.first.data());
    } else {
      return null;
    }
  }

}
