import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class ChatAndAuthRepository {

  Future<Result<bool>> registration({required String email,password});

  Future<Result<UserCredential>> signIn({required String email,password});

  Future<void> resendEmailVerification();

  Future<void> signOut();

  Stream<List<Map<String, dynamic>>> getUsersStream();

}