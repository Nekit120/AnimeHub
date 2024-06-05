import '../../../../core/data/firebase_services/model/user_model.dart';
import '../repository/chat_and_auth_repository.dart';

class GetUsersStreamUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;

  GetUsersStreamUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

  Stream<List<UserModel>>  call()  {
    final requestResult =  _chatAndAuthRepository.getUsersStream();
    return requestResult;
  }

}