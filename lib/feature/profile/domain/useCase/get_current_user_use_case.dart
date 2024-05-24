import 'package:anime_hub/feature/profile/domain/repository/profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';



class GetCurrentUserUseCase{
  final ProfileRepository _profileRepository;

  GetCurrentUserUseCase({required ProfileRepository profileRepository}): _profileRepository = profileRepository;

  User? call()  {
    final requestResult =  _profileRepository.getCurrentUser();
    return requestResult;
  }

}