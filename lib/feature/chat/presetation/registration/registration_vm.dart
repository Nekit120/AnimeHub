import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

import '../../../../core/presentation/controllers/app_text_editing_controller.dart';
import '../../../../core/presentation/controllers/password_text_editing_controller.dart';
import '../../../../theme/theme_colors.dart';
import '../../domain/repository/chat_and_auth_repository.dart';
import '../../domain/useCase/registration_with_email_use_case.dart';

class RegistrationViewModel extends ViewModel {
  final RegistrationWithEmailUseCase _registrationWithEmailUseCase;
  RegistrationViewModel(super.context,{required ChatAndAuthRepository chatAndAuthRepository }): _registrationWithEmailUseCase = RegistrationWithEmailUseCase(chatAndAuthRepository: chatAndAuthRepository);

  final passwordTextCtrl = PassTextEditingController();
  final emailTextCtrl = AppTextEditingController();
  final usernameTextCtrl = AppTextEditingController();
  final isButtonActive = false.rv;
  final isMoreEightCharacters = false.rv;
  final isContainsNumbers = false.rv;

  bool _containsDigits({required String password}) {
    final regex = RegExp(r'\d');
    return regex.hasMatch(password);
  }

  void customSnackBarShow({required String title,required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(title)),
        duration: const Duration(milliseconds: 2000),
        backgroundColor: isError ? LightThemeColors.mdThemeLightError :Colors.green[500]   ,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  Future<void> registration() async{
    final result = await _registrationWithEmailUseCase.call(email: emailTextCtrl.text,password: passwordTextCtrl.text,username: usernameTextCtrl.text );
    switch(result){
      case GoodUseCaseResult<bool>():
        {
          customSnackBarShow(title: "Письмо с подтверждением отправлена на E-mail", isError: false);
        }
      case BadUseCaseResult<bool>():
        {
          customSnackBarShow(title: "Ошибка запроса к серверу", isError: true);

        }
    }
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
