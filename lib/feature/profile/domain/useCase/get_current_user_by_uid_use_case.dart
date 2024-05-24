import 'package:anime_hub/feature/profile/domain/repository/profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/data/firebase_services/model/user_model.dart';



class GetCurrentUserByUidUseCase{
  final ProfileRepository _profileRepository;

  GetCurrentUserByUidUseCase({required ProfileRepository profileRepository}): _profileRepository = profileRepository;

    Future<UserModel?> call({required String uid}) async  {
    final requestResult =  _profileRepository.getUserByUid(uid: uid);
    return await requestResult;
  }

}