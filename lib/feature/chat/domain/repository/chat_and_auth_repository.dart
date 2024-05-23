import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/data/firebase_services/model/user_model.dart';

abstract interface class ChatAndAuthRepository {
  Future<Result<bool>> registration(
      {required String email, password, username});

  Future<Result<UserCredential>> signIn({required String email, password});

  Future<void> resendEmailVerification();

  Future<void> signOut();

  Future<void> sendMessage({required String receiverID, required String message});

  User? getCurrentUser();

  Stream<List<UserModel>> getUsersStream();

  Stream<QuerySnapshot> getMessage({required String userId, required String otherUserId});
}
