import 'package:cloud_firestore/cloud_firestore.dart';

import '../repository/chat_and_auth_repository.dart';

class GetMessageUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  GetMessageUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

  Stream<QuerySnapshot>  call({required String userId, required String otherUserId})  {
    return _chatAndAuthRepository.getMessage(userId: userId, otherUserId: otherUserId);
  }

}