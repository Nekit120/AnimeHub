import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:reactive_variables/reactive_variables.dart';

import '../../../../core/presentation/controllers/app_text_editing_controller.dart';
import '../../../../core/presentation/controllers/password_text_editing_controller.dart';

class RegistrationViewModel extends ViewModel {
  RegistrationViewModel(super.context);

  final passwordTextCtrl = PassTextEditingController();
  final emailTextCtrl = AppTextEditingController();
  final isButtonActive = false.rv;
  final isMoreEightCharacters = false.rv;
  final isContainsNumbers = false.rv;

  bool _containsDigits({required String password}) {
    final regex = RegExp(r'\d');
    return regex.hasMatch(password);
  }

  void _buttonPossibilityListener() {
    passwordTextCtrl.text.length > 7
        ? isMoreEightCharacters.value = true
        : isMoreEightCharacters.value = false;

    _containsDigits(password: passwordTextCtrl.text)
        ? isContainsNumbers.value = true
        : isContainsNumbers.value = false;

    if ( emailTextCtrl.text.isNotEmpty && isMoreEightCharacters.value &&  isContainsNumbers.value ) {

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
