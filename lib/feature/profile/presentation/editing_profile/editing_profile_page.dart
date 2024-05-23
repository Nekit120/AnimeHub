import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../core/presentation/view/view_model.dart';
import 'editing_profile_vm.dart';

@RoutePage()
class EditingProfilePage extends BaseView<EditingProfileViewModel> {
  final bool _appBarState = true;

  EditingProfilePage({super.key})
      : super(vmFactory: (context) => EditingProfileViewModel(context));

  AppBar _profileAppBar({required BuildContext context}) => AppBar(
      title: Text("Редактирование профиля"),
      actions: _appBarState
          ? [
              IconButton(
                  icon: const Icon(
                    Icons.check,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ]
          : null);

  Widget _customTextField({
    required String text,
    required TextEditingController textEditingController,
  }) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }

  final _maskFormatPhoneNumber = MaskTextInputFormatter(
      mask: '+### ### ## ###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  Widget _phoneNumberTextFieldWidget({required EditingProfileViewModel vm}) =>
      TextField(
        controller: vm.phoneTextController,
        keyboardType: TextInputType.phone,
        inputFormatters: [_maskFormatPhoneNumber],
        decoration: const InputDecoration(
          labelText: "Телефон",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      );

  Widget _personalProfileBody({required EditingProfileViewModel vm}) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 116,
                height: 116,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                      "https://www.wild-pro.ru/wp-content/uploads/2023/04/no-profile-min.png"),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _customTextField(
                text: "username",
                textEditingController: vm.nameTextController),
            const SizedBox(height: 16),
            _customTextField(
                text: "number phone",
                textEditingController: vm.surnameTextController),
            const SizedBox(height: 16),
            _customTextField(
                text: "E-mal",
                textEditingController: vm.eMailTextController),
            const SizedBox(height: 16),
          ],
        ),
      );

  @override
  Widget build(EditingProfileViewModel vm) {
    return Scaffold(
      appBar: _profileAppBar(context: vm.context),
      body: _personalProfileBody(vm: vm),
    );
  }
}
