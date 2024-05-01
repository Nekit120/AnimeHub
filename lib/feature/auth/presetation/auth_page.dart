import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/auth/presetation/auth_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class AuthPage extends BaseView<AuthViewModel> {
  const AuthPage({super.key, required super.vmFactory});

  @override
  Widget build(AuthViewModel vm) {
    return Container(
    );
  }
}
