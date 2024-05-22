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
        message: message);

    List<String> ids = [currentUserId, receiverID];
    ids.sort();
    String chatRoomId = ids.join("_");
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection(message)
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
        .snapshots();
  }
}
