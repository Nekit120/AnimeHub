import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/feature/auth/data/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/domain/app_error/app_error.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseService _authFirebaseService;

  AuthRepositoryImpl({required AuthFirebaseService authFirebaseService})
      : _authFirebaseService = authFirebaseService;

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
}
