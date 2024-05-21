import 'package:flutter/material.dart';

import '../../../core/presentation/controllers/password_text_editing_controller.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final PassTextEditingController _passTextEditingController;
  final String _hintLabelText;

  const PasswordTextFieldWidget({
    super.key,
    required PassTextEditingController passTextEditingController,
    required String labelText,
  })  : _hintLabelText = labelText,
        _passTextEditingController = passTextEditingController;

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  final _passwordRegExp = RegExp(r'^[a-zA-Z0-9]+$');

  void addNewValidCharacters(String value) {
    final validCharacters =
    value.split('').where((char) => _passwordRegExp.hasMatch(char)).join();
    if (value != validCharacters) {
      widget._passTextEditingController.value = TextEditingValue(
        text: validCharacters,
        selection: TextSelection.collapsed(offset: validCharacters.length),
      );
    }
  }

  void changePasswordVisible() {
    widget._passTextEditingController.isTextHidden.value =
    !widget._passTextEditingController.isTextHidden.value;
  }

  @override
  Widget build(BuildContext context) {
    return widget._passTextEditingController.isTextHidden
        .observer((context, value) => SizedBox(
      height: 60,
          child: TextField(
                controller: widget._passTextEditingController,
                obscureText: value,
                onChanged: (value) {
          addNewValidCharacters(value);
                },
                decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.lock_outline,
            ),
          ),
          suffixIcon: IconButton(
            padding: const EdgeInsets.all(15),
            icon: Icon(
              value
                  ? Icons.remove_red_eye_outlined
                  : Icons.visibility_off_outlined,
            ),
            onPressed: changePasswordVisible,
          ),
          labelText: widget._hintLabelText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
                ),
              ),
        ));
  }
}