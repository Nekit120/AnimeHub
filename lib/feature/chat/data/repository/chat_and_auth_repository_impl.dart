import 'dart:developer';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/feature/chat/data/services/chat/chat_sevice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/domain/app_error/app_error.dart';
import '../../domain/repository/chat_and_auth_repository.dart';
import '../services/auth/auth_service.dart';

class ChatAndAuthRepositoryImpl implements ChatAndAuthRepository {
  final AuthFirebaseService _authFirebaseService;
  final ChatFirebaseService _chatFirebaseService;

  ChatAndAuthRepositoryImpl({required AuthFirebaseService authFirebaseService,
    required ChatFirebaseService chatFirebaseService
  })
      : _authFirebaseService = authFirebaseService,
        _chatFirebaseService = chatFirebaseService;

  @override
  Future<Result<bool>> registration({required String email, password}) async {
    try {
      await _authFirebaseService.registration(email: email, password: password);
      return const Result.good(true);
    } on FirebaseException catch (e) {
      return Result.bad([SpecificError(e.toString())]);
    } catch (e) {
      return Result.bad([SpecificError("unknownException")]);
    }
  }

  @override
  Future<void> resendEmailVerification() async {
    try {
      await _authFirebaseService.resendEmailVerification();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<Result<UserCredential>> signIn(
      {required String email, password}) async {
    try {
      final result =
          await _authFirebaseService.signIn(email: email, password: password);
      return Result.good(result);
    } on FirebaseException catch (e) {
      return Result.bad([SpecificError(e.toString())]);
    } catch (e) {
      return Result.bad([SpecificError("unknownException")]);
    }
  }

  @override
  Future<void> signOut() async {
    await _authFirebaseService.signOut();
  }

  @override
  Stream<List<Map<String, dynamic>>> getUsersStream()   {
    return _chatFirebaseService.getUsersStream();
  }



}
