import 'package:anime_hub/feature/chat/data/services/model/message_model.dart';
import 'package:anime_hub/feature/chat/data/services/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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



  Stream<QuerySnapshot> getChatMessages(String chatRoomId) {
    return _firestore
        .collection("chat_rooms")
        .doc("SErOoj4xqoZXla3jsRWHgm1B3Mz2_X4JFsWbKYieny7GqgjQREccj1Bg2")
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();

    // return _firestore
    //     .collection("chat_rooms")
    //     .doc("SErOoj4xqoZXla3jsRWHgm1B3Mz2_X4JFsWbKYieny7GqgjQREccj1Bg2")
    //     .collection("messages") // Предполагая, что коллекция называется "messages"
    //     .orderBy("timestamp", descending: true) // Сортируем сообщения по времени
    //     .snapshots());
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
        .snapshots();
  }
}
