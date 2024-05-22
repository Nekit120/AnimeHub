import '../repository/chat_and_auth_repository.dart';

class SendMessageUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  SendMessageUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

  Future<void> call({required String receiverID, required String message}) async {
    await _chatAndAuthRepository.sendMessage(receiverID: receiverID, message: message);
  }

}