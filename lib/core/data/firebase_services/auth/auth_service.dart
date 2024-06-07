import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../model/user_model.dart';

class AuthFirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =   FirebaseFirestore.instance;

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

        UserModel(uid: userCredential.user!.uid, email: email, username: username,profileImageUrl: null,phoneNumber: null, friends: [], usernameLowerCase: username.toLowerCase()).toJson()
    );

    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<String?> uploadProfileImage({required String uid,required XFile imageFile}) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('profile_images/$uid.jpg');
      await storageRef.putFile(File(imageFile.path));
      return await storageRef.getDownloadURL();
    } catch (e) {
      print('Error uploading profile image: $e');
      return null;
    }
  }

  Future<void> updateProfileImage({required String uid,required XFile? imageFile, required String username,required String phoneNumber}) async {
    if (imageFile != null) {
      final String? downloadUrl = await uploadProfileImage(uid: uid, imageFile: imageFile);
      if (downloadUrl != null) {
        if(phoneNumber.length ==15 && username.length > 4) {
          await _firestore.collection('Users').doc(uid).update({
            'profileImageUrl': downloadUrl,
            'username': username,
            'usernameLowerCase': username.toLowerCase(),
            'phoneNumber': phoneNumber
          });
        } else if (phoneNumber.length ==15 && username.length < 4) {
          await _firestore.collection('Users').doc(uid).update({
            'profileImageUrl': downloadUrl,
            'phoneNumber': phoneNumber
          });
        } else if (phoneNumber.length !=15 && username.length > 4) {
          await _firestore.collection('Users').doc(uid).update({
            'profileImageUrl': downloadUrl,
            'username': username,
            'usernameLowerCase': username.toLowerCase(),
          });
        }else {
          await _firestore.collection('Users').doc(uid).update({
            'profileImageUrl': downloadUrl,
          });
        }
      }
    } else {
      if(username.length > 4  && phoneNumber.length ==15) {
        await _firestore.collection('Users').doc(uid).update({
          'username': username,
          'usernameLowerCase': username.toLowerCase(),
          'phoneNumber': phoneNumber
        });
      }
      else if(username.length < 4  && phoneNumber.length ==15) {
        await _firestore.collection('Users').doc(uid).update({
          'phoneNumber': phoneNumber
        });
      }  else if(username.length < 4  && phoneNumber.length !=15) {
      }else {
        await _firestore.collection('Users').doc(uid).update({
          'username': username,
          'usernameLowerCase': username.toLowerCase(),

        });
      }

    }
  }

  Future<UserModel?> getUserByUid({required String uid}) async {
    try {
      var userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .get();
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
        .set(  UserModel(uid: userCredential.user!.uid, email: email, username: username, friends: [], usernameLowerCase: username.toLowerCase()).toJson()
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
