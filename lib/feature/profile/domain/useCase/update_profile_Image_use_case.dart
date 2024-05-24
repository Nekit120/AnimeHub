import 'package:anime_hub/feature/profile/domain/repository/profile_repository.dart';
import 'package:image_picker/image_picker.dart';



class UpdateProfileImageUseCase{
  final ProfileRepository _profileRepository;

  UpdateProfileImageUseCase({required ProfileRepository profileRepository}): _profileRepository = profileRepository;

    Future<void> call({required String uid,required XFile? imageFile})async  {
    await _profileRepository.updateProfileImage(uid: uid, imageFile: imageFile);
  }

}