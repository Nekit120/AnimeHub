import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/feature/chat/data/services/model/user_model.dart';

import '../repository/chat_and_auth_repository.dart';

class GetUsersStreamUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  GetUsersStreamUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

  Stream<List<UserModel>>  call()  {
    final requestResult =  _chatAndAuthRepository.getUsersStream();
    return requestResult;
  }

}