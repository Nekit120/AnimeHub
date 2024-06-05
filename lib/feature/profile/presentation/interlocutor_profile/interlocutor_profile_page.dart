import 'package:anime_hub/core/data/firebase_services/model/user_model.dart';
import 'package:anime_hub/core/data/firebase_services/model/user_model_with_last_message.dart';
import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/core/domain/router/router.gr.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/profile/domain/repository/profile_repository.dart';
import 'package:anime_hub/feature/profile/domain/state_manager/profile/profile_notifier.dart';
import 'package:anime_hub/feature/profile/presentation/profile/profile_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'interlocutor_profile_vm.dart';

@RoutePage()
class InterlocutorProfilePage extends BaseView<InterlocutorProfileViewModel> {
  final UserModelWithLastMessage userModel;
  InterlocutorProfilePage({super.key, required this.userModel})
      : super(
            vmFactory: (context) => InterlocutorProfileViewModel(context));

  AppBar _profileAppBar() {
    return AppBar(
      title: const Text("Профиль"),
    );
  }

  Widget _personalProfileBody({required InterlocutorProfileViewModel vm,required UserModelWithLastMessage userModel}) {
    return  userModel == null ?  const Center(child: CircularProgressIndicator(),)
      :  Padding(
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
                      userModel.profileImageUrl == null
                          ? "https://www.wild-pro.ru/wp-content/uploads/2023/04/no-profile-min.png"
                          : userModel.profileImageUrl!,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                  userModel.username,
                  style: Theme.of(vm.context).textTheme.titleLarge),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: double.infinity,
              child: Divider(),
            ),
            const SizedBox(height: 16),
            Text("E-mail",
                style: Theme.of(vm.context).textTheme.labelMedium!),
            Text(userModel.email,
                style: Theme.of(vm.context).textTheme.bodyLarge!),
            const SizedBox(height: 16),
            Text("Телефон",
                style: Theme.of(vm.context).textTheme.labelMedium!),
            Text(userModel.phoneNumber == null ? "—" : userModel.phoneNumber!,
                style: Theme.of(vm.context).textTheme.bodyLarge!),
          ],
        ),
  );


  }

  @override
  Widget build(InterlocutorProfileViewModel vm) {
    return Scaffold(
      appBar: _profileAppBar(),
      body: _personalProfileBody(vm: vm, userModel: userModel),
    );
  }
}
