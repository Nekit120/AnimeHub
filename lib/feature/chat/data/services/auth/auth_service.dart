import 'dart:async';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<void> registration({required String email,password}) async {
        UserCredential userCredential  = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        User? user = userCredential.user;
        if (user != null && !user.emailVerified) {
          await user.sendEmailVerification();
        }
        await _auth.signOut();
    }

    Future<UserCredential> signIn({required String email,password}) async {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;

      // Выход из системы, если почта не подтверждена
      if (user != null && !user.emailVerified) {
        await _auth.signOut();
        resendEmailVerification();
        throw Exception('Email not verified. Please check your email for verification link.');
      }

      return userCredential;

  }

  Future<void> resendEmailVerification() async {
    User? user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    } else {
      throw Exception('No user is currently signed in or email is already verified.');
    }
  }

  Future<void> signOut() async {
      return await _auth.signOut();
  }

}