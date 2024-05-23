import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/feature/chat/data/services/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repository/chat_and_auth_repository.dart';

class GetCurrentUserUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  GetCurrentUserUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

  User? call()  {
    final requestResult =  _chatAndAuthRepository.getCurrentUser();
    return requestResult;
  }

}