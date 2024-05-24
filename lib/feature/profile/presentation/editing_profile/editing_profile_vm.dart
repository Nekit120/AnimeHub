import 'package:image_picker/image_picker.dart';
import 'package:reactive_variables/reactive_variables.dart';

import '../../../../core/data/firebase_services/model/user_model.dart';
import '../../../../core/presentation/controllers/app_text_editing_controller.dart';
import '../../../../core/presentation/view/view_model.dart';
import '../../domain/repository/profile_repository.dart';
import '../../domain/useCase/update_profile_Image_use_case.dart';

class EditingProfileViewModel extends ViewModel {
  final UpdateProfileImageUseCase updateProfileImageUseCase;
  final Rv<XFile?>imageFile = null.rv();
  final UserModel userModel;

  EditingProfileViewModel(super.context, {required ProfileRepository profileRepository,required this.userModel})
      :updateProfileImageUseCase = UpdateProfileImageUseCase(profileRepository: profileRepository)
  ;

  AppTextEditingController nameTextController = AppTextEditingController();
  AppTextEditingController surnameTextController = AppTextEditingController();
  AppTextEditingController eMailTextController = AppTextEditingController();
  AppTextEditingController phoneTextController = AppTextEditingController();

  final changeProfilePossible = false.rv;

  @override
  void initState() {
    nameTextController.text = userModel.username;

    if(userModel.phoneNumber != null) {
      phoneTextController.text = userModel.phoneNumber!;
    }

     eMailTextController.text = userModel.email;


    nameTextController.text = userModel.username;
    super.initState();
  }
}
