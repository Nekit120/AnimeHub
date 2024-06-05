import 'dart:async';
import 'dart:developer';
import 'package:anime_hub/core/data/firebase_services/model/message_model.dart';
import 'package:anime_hub/core/data/firebase_services/model/user_model_with_last_message.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/data/firebase_services/auth/auth_service.dart';
import '../../../../core/data/firebase_services/chat/chat_sevice.dart';
import '../../../../core/data/firebase_services/model/user_model.dart';
import '../../../../core/domain/app_error/app_error.dart';
import '../../domain/repository/chat_and_auth_repository.dart';

class ChatAndAuthRepositoryImpl implements ChatAndAuthRepository {
  final AuthFirebaseService _authFirebaseService;
  final ChatFirebaseService _chatFirebaseService;

  ChatAndAuthRepositoryImpl({required AuthFirebaseService authFirebaseService,
    required ChatFirebaseService chatFirebaseService
  })
      : _authFirebaseService = authFirebaseService,
        _chatFirebaseService = chatFirebaseService;

  @override
  Future<Result<bool>> registration({required String email, password, username}) async {
    try {
      await _authFirebaseService.registration(email: email, password: password,username: username);
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
      {required String email, password, username}) async {
    try {
      final result =
          await _authFirebaseService.signIn(email: email, password: password);
      return Result.good(result);
    } on FirebaseException catch (e) {
      return Result.bad([SpecificError(e.code)]);
    } catch (e) {
      return Result.bad([SpecificError(e.toString())]);
    }
  }

  @override
  Future<void> signOut() async {
    await _authFirebaseService.signOut();
  }

  @override
  Stream<List<UserModel>> getUsersStream()   {
    return _chatFirebaseService.getUsersStream();
  }

  @override
  User? getCurrentUser()  {
    return  _authFirebaseService.getCurrentUser();
  }

  @override
  Stream<QuerySnapshot<Object?>> getMessage({required String userId, required String otherUserId}) {
    return _chatFirebaseService.getMessage(userId: userId, otherUserId: otherUserId);
  }

  @override
  Future<void> sendMessage({required String receiverID, required String message}) {
    return _chatFirebaseService.sendMessage(receiverID: receiverID, message: message);
  }

  @override
  Future<UserModel?> getUserByUid({required String uid}) async {
    return await _authFirebaseService.getUserByUid(uid: uid);
  }

  @override
  Future<MessageModel?> getLastMessage({required String userId, required String otherUserId}) async {
    return await _chatFirebaseService.getLastMessage(userId: userId, otherUserId: otherUserId);
  }

  @override
  Stream<List<UserModelWithLastMessage>> getUserModelWithLastMessage({required String currentUserUid}) {
      return  _chatFirebaseService.getUserModelWithLastMessage(currentUserUid: currentUserUid);
  }

  @override
  Future<void> sendInvite({required String animeLink, required String animeName, required String animePoster, required String proposedId, required String acceptId}) async {
    await _chatFirebaseService.sendInvite(animeLink: animeLink, animeName: animeName, animePoster: animePoster, proposedId: proposedId, acceptId: acceptId);
  }





}
