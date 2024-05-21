
import '../repository/chat_and_auth_repository.dart';

class ResendEmailVerificationUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  ResendEmailVerificationUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

  Future<void> call({required String email,password}) async {
       await _chatAndAuthRepository.resendEmailVerification();
  }

}