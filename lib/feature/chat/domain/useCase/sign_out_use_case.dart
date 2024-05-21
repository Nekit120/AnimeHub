
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';

import '../repository/chat_and_auth_repository.dart';

class SignOutUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  SignOutUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

  Future<void> call() async {
   await _chatAndAuthRepository.signOut();
  }

}