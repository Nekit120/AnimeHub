
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repository/chat_and_auth_repository.dart';

class SignInWithEmailUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  SignInWithEmailUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

  Future<Result<UserCredential>> call({required String email,password}) async {
    final requestResult = await _chatAndAuthRepository.signIn(email: email,password: password );
    return requestResult;
  }

}