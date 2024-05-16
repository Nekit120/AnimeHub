import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/auth/presetation/auth_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class AuthPage extends BaseView<AuthViewModel> {
   AuthPage({super.key}) :super(
     vmFactory: (context) => AuthViewModel(context)
   );

  @override
  Widget build(AuthViewModel vm) {
    return Container(
    );
  }
}
