import 'dart:async';

import 'package:flutter/material.dart';

import '../../../theme/theme_colors.dart';

class CustomFilledButton extends StatefulWidget {
  final bool _isButtonActive;
  final String _titleButton;
  final FutureOr<void> Function() _buttonCallback;

  const CustomFilledButton(
      {super.key, required bool isButtonActive, required String titleButton, required Future<void> Function() buttonCallback}) : _buttonCallback = buttonCallback, _titleButton = titleButton, _isButtonActive = isButtonActive;

  @override
  State<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
  bool _isLoading = false;

  Future<void> _onPressed() async {
    if (_isLoading) return;
    try {
      setState(() => _isLoading = true);
      await widget._buttonCallback.call();
    } finally {
      setState(() => _isLoading = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton(
        onPressed: widget._isButtonActive ? _onPressed : null,
        child: !_isLoading
            ? Text(widget._titleButton)
            : const CircularProgressIndicator.adaptive(),
        ),
    );
  }
}