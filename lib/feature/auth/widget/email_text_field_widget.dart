import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../generated/l10n.dart';




class EmailTextFieldWidget extends StatefulWidget {
  final TextEditingController _controller;

  const EmailTextFieldWidget({required TextEditingController controller, super.key}) : _controller = controller;

  @override
  State<EmailTextFieldWidget> createState() =>
      _EmailTextFieldWidgetState();
}

class _EmailTextFieldWidgetState
    extends State<EmailTextFieldWidget> {
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
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.email_outlined),
          ),
          labelText: S.of(context).email,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
    );
  }
}
