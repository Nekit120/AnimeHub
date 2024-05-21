
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';

import '../repository/chat_and_auth_repository.dart';

class RegistrationWithEmailUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  RegistrationWithEmailUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

  Future<Result<bool>> call({required String email,password}) async {
    final requestResult = await _chatAndAuthRepository.registration(email: email,password: password );
    return requestResult;
  }

}