import 'package:anime_hub/feature/profile/domain/useCase/get_current_user_by_uid_use_case.dart';
import 'package:anime_hub/feature/profile/domain/useCase/get_current_user_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_variables/reactive_variables.dart';

import '../../../../core/data/firebase_services/model/user_model.dart';
import '../../../../core/presentation/controllers/app_text_editing_controller.dart';
import '../../../../core/presentation/view/view_model.dart';
import '../../domain/repository/profile_repository.dart';
import '../../domain/useCase/update_profile_Image_use_case.dart';

class EditingProfileViewModel extends ViewModel {
  final UpdateProfileImageUseCase updateProfileImageUseCase;

  final GetCurrentUserUseCase getCurrentUserUseCase;
  final GetCurrentUserByUidUseCase getCurrentUserByUidUseCase;
  final Rv<XFile?>imageFile = null.rv();
  final UserModel userModel;

  EditingProfileViewModel(super.context, {required ProfileRepository profileRepository,required this.userModel})
      :updateProfileImageUseCase = UpdateProfileImageUseCase(profileRepository: profileRepository),getCurrentUserUseCase =
  GetCurrentUserUseCase(profileRepository: profileRepository),
        getCurrentUserByUidUseCase = GetCurrentUserByUidUseCase(profileRepository: profileRepository)
  ;

  AppTextEditingController nameTextController = AppTextEditingController();
  AppTextEditingController surnameTextController = AppTextEditingController();
  AppTextEditingController phoneController = AppTextEditingController();

  final changeProfilePossible = false.rv;

  Future<UserModel?>  getCurrentUserByUid() async {
    final  user =  await getCurrentUserByUidUseCase.call(uid: userModel.uid);
    return user;
  }

  @override
  void initState() {
    nameTextController.text = userModel.username;

    if(userModel.phoneNumber != null) {
      phoneController.text = userModel.phoneNumber!;
    }

    nameTextController.text = userModel.username;
    super.initState();
  }
}
