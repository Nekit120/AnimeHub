import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/data/firebase_services/model/message_model.dart';
import '../../../../core/data/firebase_services/model/user_model_with_last_message.dart';
import '../repository/chat_and_auth_repository.dart';

class GetUserWithLastMessageUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  GetUserWithLastMessageUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

  Stream<List<UserModelWithLastMessage>> call({required String currentUserUid})  {
    return _chatAndAuthRepository.getUserModelWithLastMessage(currentUserUid: currentUserUid);
  }

}