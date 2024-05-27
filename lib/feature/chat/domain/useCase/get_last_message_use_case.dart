import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/data/firebase_services/model/message_model.dart';
import '../repository/chat_and_auth_repository.dart';

class GetLastMessageUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  GetLastMessageUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

  Future<MessageModel?> call({required String userId, required String otherUserId})  {
    return _chatAndAuthRepository.getLastMessage(userId: userId, otherUserId: otherUserId);
  }

}