
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/feature/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInWithEmailUseCase{
  final AuthRepository _authRepository;

  SignInWithEmailUseCase({required AuthRepository authRepository}): _authRepository = authRepository;

  Future<Result<UserCredential>> call({required String email,password}) async {
    final requestResult = await _authRepository.signIn(email: email,password: password );
    return requestResult;
  }

}