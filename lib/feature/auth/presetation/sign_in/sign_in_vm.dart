import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:reactive_variables/reactive_variables.dart';

import '../../../../core/presentation/controllers/app_text_editing_controller.dart';
import '../../../../core/presentation/controllers/password_text_editing_controller.dart';

class SignInViewModel extends ViewModel {
  SignInViewModel(super.context);
  final passwordTextCtrl = PassTextEditingController();
  final emailTextCtrl = AppTextEditingController();
  final isButtonActive = false.rv;

  void _buttonPossibilityListener() {
  if(passwordTextCtrl.text.length > 7 && emailTextCtrl.text.isNotEmpty){
    isButtonActive.value = true;
  } else {
    isButtonActive.value = false;
  }
  }

  @override
  void initState() {
    super.initState();
    passwordTextCtrl.addListener(_buttonPossibilityListener);
    emailTextCtrl.addListener(_buttonPossibilityListener);
  }

  @override
  void dispose() {
    passwordTextCtrl.removeListener(_buttonPossibilityListener);
    emailTextCtrl.removeListener(_buttonPossibilityListener);
    super.dispose();
  }

}