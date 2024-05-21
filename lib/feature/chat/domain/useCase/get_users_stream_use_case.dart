import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';

import '../repository/chat_and_auth_repository.dart';

class GetUsersStreamUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  GetUsersStreamUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

  Stream<List<Map<String, dynamic>>>  call()  {
    final requestResult =  _chatAndAuthRepository.getUsersStream();
    return requestResult;
  }

}