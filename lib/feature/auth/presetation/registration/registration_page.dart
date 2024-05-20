import 'package:anime_hub/feature/auth/presetation/registration/registration_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../../../../core/presentation/view/view_model.dart';
import '../../../../theme/theme_colors.dart';
import '../../widget/custom_filled_button.dart';
import '../../widget/email_text_field_widget.dart';
import '../../widget/password_text_field_widget.dart';

@RoutePage()
class RegistrationPage extends BaseView<RegistrationViewModel> {
  RegistrationPage({super.key})
      : super(vmFactory: (context) => RegistrationViewModel(context));

  Widget _checkMarkWidget({required bool isRight,required RegistrationViewModel vm,required String textCheckMark}) {
    return isRight ?
    Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: LightThemeColors.positiveCheckBack,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: LightThemeColors.positiveCheck,
          ),
        ),
        const SizedBox(width: 8,),
        Text(
            textCheckMark,
            style: Theme.of(vm.context).textTheme.headlineLarge
        ),
      ],
    )
        : Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: LightThemeColors.negativeCheckBack,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: LightThemeColors.negativeCheck,
          ),
        ),
        const SizedBox(width: 8,),
        Text(
          textCheckMark,
          style: Theme.of(vm.context).textTheme.headlineLarge?.apply(
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(RegistrationViewModel vm) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 176, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text("Registration",
                        style: Theme.of(vm.context).textTheme.displayMedium)),
                const SizedBox(
                  height: 18,
                ),
                EmailTextFieldWidget(
                  controller: vm.emailTextCtrl,
                ),
                const SizedBox(
                  height: 16,
                ),
                PasswordTextFieldWidget(
                  passTextEditingController: vm.passwordTextCtrl,
                  labelText: 'Пароль',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Ваш пороль должен содержать:",
                  style: Theme.of(vm.context).textTheme.headlineLarge?.apply(
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                vm.isMoreEightCharacters.observer((context, value) =>
                    _checkMarkWidget(isRight: value, vm: vm, textCheckMark: 'Минимум 8 символов',)
                ),
                const SizedBox(
                  height: 8,
                ),
                vm.isContainsNumbers.observer((context, value) =>
                    _checkMarkWidget(isRight: value, vm: vm, textCheckMark: 'Содержит цифры',),
                ),
                const SizedBox(
                  height: 16
                ),
                vm.isButtonActive.observer((context, value) =>
                    CustomFilledButton(
                        isButtonActive: value,
                        titleButton: "Войти",
                        buttonCallback: () async {}),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
