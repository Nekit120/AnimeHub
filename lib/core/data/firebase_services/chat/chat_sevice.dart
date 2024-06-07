import 'dart:developer';

import 'package:anime_hub/core/data/firebase_services/model/user_model_with_last_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/message_model.dart';
import '../model/offer_to_watch_anime.dart';
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

  Future<void> addFriend(
      {required String userId, required String friendUid}) async {
    await _firestore.collection('Users').doc(userId).update({
      'friends': FieldValue.arrayUnion([friendUid])
    });
  }
  Future<void> removeFriend(
      {required String userId, required String friendUid}) async {
    await _firestore.collection('Users').doc(userId).update({
      'friends': FieldValue.arrayRemove([friendUid])
    });
  }

  Future<UserModel?> getUserByUid({required String uid}) async {
    try {
      var userDoc =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      if (userDoc.exists) {
        return UserModel.fromJson(userDoc.data()!);
      } else {
        return null;
      }
    } catch (e) {
      print("Error getting user by UID: $e");
      return null;
    }
  }

  Stream<List<UserModelWithLastMessage>> getUserModelWithLastMessage(
      {required String currentUserUid}) {
    return _firestore
        .collection("Users")
        .snapshots()
        .asyncMap((snapshots) async {
      List<UserModelWithLastMessage> userModelWithLastMessages = [];
      final currentUser = await getUserByUid(uid: currentUserUid);
      if (currentUser != null &&
          currentUser.friends != null &&
          currentUser.friends!.isNotEmpty) {
        for (var doc in snapshots.docs) {
          final users = UserModel.fromJson(doc.data());
          for (var otherUid in currentUser.friends!) {
            if (users.uid == otherUid) {
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
                lastMessage =
                    MessageModel.fromJson(querySnapshot.docs.first.data())
                        .message;
              }

              userModelWithLastMessages.add(UserModelWithLastMessage(
                uid: users.uid,
                email: users.email,
                username: users.username,
                phoneNumber: users.phoneNumber,
                profileImageUrl: users.profileImageUrl,
                lastMessage: lastMessage,
                friends: users.friends,
              ));
            }
          }
        }

        return userModelWithLastMessages;
      } else {
        return [];
      }
    });
  }

  Future<List<UserModelWithLastMessage>> getUserModelWithLastMessageByName({
    required String currentUserUid,
    required String searchTerm,
  }) async {
    final userSnapshots = await _firestore
        .collection("Users")
        .where("usernameLowerCase",
            isGreaterThanOrEqualTo: searchTerm.toLowerCase())
        .where("usernameLowerCase",
            isLessThanOrEqualTo: searchTerm.toLowerCase() + '\uf8ff')
        .get();

    List<UserModelWithLastMessage> userModelWithLastMessages = [];

    for (var doc in userSnapshots.docs) {
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
        lastMessage =
            MessageModel.fromJson(querySnapshot.docs.first.data()).message;
      }

      userModelWithLastMessages.add(UserModelWithLastMessage(
        uid: users.uid,
        email: users.email,
        username: users.username,
        phoneNumber: users.phoneNumber,
        profileImageUrl: users.profileImageUrl,
        lastMessage: lastMessage,
        friends: users.friends,
      ));
    }

    return userModelWithLastMessages;
  }

  // Future<List<UserModelWithLastMessage>> getUserModelWithLastMessageSingle(
  //     {required String currentUserUid}) async {
  //   final userSnapshots = await _firestore.collection("Users").get();
  //   List<UserModelWithLastMessage> userModelWithLastMessages = [];
  //
  //   for (var doc in userSnapshots.docs) {
  //     final users = UserModel.fromJson(doc.data());
  //     List<String> ids = [currentUserUid, users.uid];
  //     ids.sort();
  //     String chatRoomId = ids.join("_");
  //
  //     final querySnapshot = await _firestore
  //         .collection("chat_rooms")
  //         .doc(chatRoomId)
  //         .collection("messages")
  //         .orderBy("timestamp", descending: true)
  //         .limit(1)
  //         .get();
  //
  //     String lastMessage = "";
  //     if (querySnapshot.docs.isNotEmpty) {
  //       lastMessage =
  //           MessageModel.fromJson(querySnapshot.docs.first.data()).message;
  //     }
  //
  //     userModelWithLastMessages.add(UserModelWithLastMessage(
  //       uid: users.uid,
  //       email: users.email,
  //       username: users.username,
  //       phoneNumber: users.phoneNumber,
  //       profileImageUrl: users.profileImageUrl,
  //       lastMessage: lastMessage,
  //     ));
  //   }
  //
  //   return userModelWithLastMessages;
  // }

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

  ///////////////////////////////////////////////

  Future<void> sendInvite(
      {required String animeLink,
      required String animeName,
      required String animePoster,
      required String proposedId,
      required String acceptId}) async {
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    final newInvite = OfferToWatchAnime(
      animeLink: animeLink,
      animeName: animeName,
      animePoster: animePoster,
      proposedId: proposedId,
      acceptId: acceptId,
      isProposed: true,
      isAccepted: false,
      timestamp: timestamp,
    );

    List<String> ids = [currentUserId, acceptId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("offers")
        .doc("offers")
        .set(newInvite.toJson(), SetOptions(merge: false));
    // .add(newInvite.toJson());
  }

  Future<void> updateInviteAfterSend(
      {required String acceptId, required String proposedId}) async {
    List<String> ids = [acceptId, proposedId];
    ids.sort();
    String chatRoomId = ids.join("_");
    final docRef = _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("offers")
        .doc("offers");
    await docRef.update({"is_accepted": false, "is_proposed": false});
    // .add(newInvite.toJson());
  }

  Future<void> updatePositiveInviteAfterSend(
      {required String acceptId, required String proposedId}) async {
    List<String> ids = [acceptId, proposedId];
    ids.sort();
    String chatRoomId = ids.join("_");
    final docRef = _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("offers")
        .doc("offers");
    await docRef.update({"is_accepted": true, "is_proposed": true});
    // .add(newInvite.toJson());
  }

////////////////////////////////////////////////////

  Stream<OfferToWatchAnime?> offerStream(
      {required String currentUserId, required String acceptId}) {
    List<String> ids = [currentUserId, acceptId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("offers")
        .doc("offers")
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return OfferToWatchAnime.fromJson(snapshot.data()!);
      } else {
        return null;
      }
    });
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
        .orderBy("timestamp", descending: true)
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
        .orderBy("timestamp", descending: false)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return MessageModel.fromJson(querySnapshot.docs.first.data());
    } else {
      return null;
    }
  }
}
