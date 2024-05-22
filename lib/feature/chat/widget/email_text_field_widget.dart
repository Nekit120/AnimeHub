import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../generated/l10n.dart';




class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController _controller;
  final String title;
  final bool isEmail;

  const CustomTextFieldWidget({required TextEditingController controller, super.key, required this.title, required this.isEmail}) : _controller = controller;

  @override
  State<CustomTextFieldWidget> createState() =>
      _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState
    extends State<CustomTextFieldWidget> {
  // final maskFormatPhoneNumber = MaskTextInputFormatter(
  //     mask: '+### ### ## ###',
  //     filter: {"#": RegExp(r'[0-9]')},
  //     type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        controller: widget._controller,
        // keyboardType: TextInputType.phone,
        // inputFormatters: [maskFormatPhoneNumber],
        decoration: InputDecoration(
          prefixIcon:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: widget.isEmail ? const Icon(Icons.email_outlined)
            : const Icon(Icons.person_outline),
          ),
          labelText: widget.title,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
    );
  }
}
