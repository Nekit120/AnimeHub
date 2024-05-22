import 'dart:async';
import 'dart:async';

import 'package:anime_hub/feature/chat/data/services/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registration({required String email, password,username}) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    User? user = userCredential.user;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }

    _firestore
        .collection("Users")
        .doc(userCredential.user!.uid)
        .set(

        UserModel(uid: userCredential.user!.uid, email: email, username: username).toJson()
    );

    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<UserCredential> signIn({required String email, password,username}) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;

    // Выход из системы, если почта не подтверждена
    if (user != null && !user.emailVerified) {
      await _auth.signOut();
      resendEmailVerification();
      throw Exception(
          'Email not verified. Please check your email for verification link.');
    }

    _firestore
        .collection("Users")
        .doc(userCredential.user!.uid)
        .set(  UserModel(uid: userCredential.user!.uid, email: email, username: "unknown_username").toJson()
    );

    return userCredential;
  }

  Future<void> resendEmailVerification() async {
    User? user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    } else {
      throw Exception(
          'No user is currently signed in or email is already verified.');
    }
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
