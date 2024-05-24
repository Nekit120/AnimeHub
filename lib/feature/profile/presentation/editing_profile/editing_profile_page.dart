import 'dart:ffi';
import 'dart:io';

import 'package:anime_hub/core/data/firebase_services/model/user_model.dart';
import 'package:anime_hub/feature/profile/data/repository/profile_repository_impl.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../core/presentation/view/view_model.dart';
import '../../domain/repository/profile_repository.dart';
import 'editing_profile_vm.dart';

@RoutePage()
class EditingProfilePage extends BaseView<EditingProfileViewModel> {
  final bool _appBarState = true;
  final imagePicker = ImagePicker();

  EditingProfilePage({super.key,required ProfileRepository profileRepository,required UserModel userModel})
      : super(vmFactory: (context) => EditingProfileViewModel(context, profileRepository: profileRepository, userModel: userModel));

  AppBar _profileAppBar({required EditingProfileViewModel vm}) => AppBar(
      title: const Text("Редактирование профиля"),
      actions: _appBarState
          ? [
              IconButton(
                  icon: const Icon(
                    Icons.check,
                  ),
                  onPressed: () {
                      vm.updateProfileImageUseCase.call(uid: vm.userModel.uid, imageFile: vm.imageFile.value);
                    Navigator.of(vm.context).pop();
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

  Future<void> _pickImageFromGallery(
      {required EditingProfileViewModel vm}) async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    vm.imageFile.value = selectedImage;
  }

  Widget _personalProfileBody({required EditingProfileViewModel vm}) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                  child: SizedBox(
                    height: 116,
                    width: 116,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: vm.imageFile.observer((context, value) => value ==
                                null
                            ? Image.network(
                                "https://www.wild-pro.ru/wp-content/uploads/2023/04/no-profile-min.png")
                            : Image.file(File(value.path), fit: BoxFit.cover,))),
                  ),
                  onTap: () {
                    _pickImageFromGallery(vm: vm);
                  },
                ),
              ),

            const SizedBox(height: 16),
            _customTextField(
                text: "username", textEditingController: vm.nameTextController),
            const SizedBox(height: 16),
            _customTextField(
                text: "number phone",
                textEditingController: vm.surnameTextController),
            const SizedBox(height: 16),
            _customTextField(
                text: "E-mal", textEditingController: vm.eMailTextController),
            const SizedBox(height: 16),
          ],
        ),
      );

  @override
  Widget build(EditingProfileViewModel vm) {
    return Scaffold(
      appBar: _profileAppBar(vm: vm),
      body: _personalProfileBody(vm: vm),
    );
  }
}
