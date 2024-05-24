import 'package:anime_hub/feature/profile/domain/repository/profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/data/firebase_services/model/user_model.dart';
import '../repository/chat_and_auth_repository.dart';



class GetCurrentUserByUidUseCase{
  final ChatAndAuthRepository _chatAndAuthRepository;


GetCurrentUserByUidUseCase({required ChatAndAuthRepository chatAndAuthRepository}): _chatAndAuthRepository = chatAndAuthRepository;

    Future<UserModel?> call({required String uid}) async  {
    final requestResult =  _chatAndAuthRepository.getUserByUid(uid: uid);
    return await requestResult;
  }

}