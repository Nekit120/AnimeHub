import 'package:auto_route/annotations.dart';
import 'package:reactive_variables/reactive_variables.dart';

import '../../../../core/presentation/controllers/app_text_editing_controller.dart';
import '../../../../core/presentation/view/view_model.dart';

class EditingProfileViewModel extends ViewModel {
  EditingProfileViewModel(super.context);

  AppTextEditingController nameTextController = AppTextEditingController();
  AppTextEditingController surnameTextController = AppTextEditingController();
  AppTextEditingController eMailTextController = AppTextEditingController();
  AppTextEditingController phoneTextController = AppTextEditingController();

  final changeProfilePossible = false.rv;
}
