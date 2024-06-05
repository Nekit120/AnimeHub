import 'dart:developer';

import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/core/domain/router/router.gr.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/profile/domain/repository/profile_repository.dart';
import 'package:anime_hub/feature/profile/domain/state_manager/profile/profile_notifier.dart';
import 'package:anime_hub/feature/profile/presentation/profile/profile_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ProfilePage extends BaseView<ProfileViewModel> {
  ProfilePage({super.key, required ProfileRepository profileRepository})
      : super(
            vmFactory: (context) => ProfileViewModel(context,
                profileRepository: profileRepository));

  AppBar _profileAppBar({required ProfileViewModel vm}) {
    return AppBar(
      title: const Text("Профиль"),
      surfaceTintColor: Colors.white,
      actions: [
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final currentProfile = ref.watch(profileProvider);
            return IconButton(
                icon: const Icon(
                  Icons.create_outlined,
                ),
                onPressed: () {
                  currentProfile == null
                      ? AutoRouter.of(vm.context).push(EditingProfileRoute(
                          profileRepository:
                              AppContainer().repositoryScope.profileRepository,
                          userModel: vm.currentUser.value!))
                      : AutoRouter.of(vm.context).push(EditingProfileRoute(
                          profileRepository:
                              AppContainer().repositoryScope.profileRepository,
                          userModel: currentProfile));
                });
          },
        )
      ],
    );
  }
  Future<void> updateProfile({required ProfileViewModel vm,required WidgetRef ref}) async {
    await ref.read(profileProvider.notifier).updateProfile(getAnimeListFunction: await vm.getCurrentUserByUid());
  }

  Widget _personalProfileBody({required ProfileViewModel vm}) {
    return vm.currentUser.observer((context, value) => value == null
        ? const Center(child: CircularProgressIndicator())
        : Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final currentProfile = ref.watch(profileProvider);
              return currentProfile == null ? const Center(child: CircularProgressIndicator(),):
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RefreshIndicator(
                  onRefresh: () async {
                    await updateProfile(vm: vm,ref: ref);
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Center(
                          child: SizedBox(
                              width: 116,
                              height: 116,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  currentProfile.profileImageUrl == null
                                          ? "https://www.wild-pro.ru/wp-content/uploads/2023/04/no-profile-min.png"
                                          : currentProfile.profileImageUrl!,
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: Text(currentProfile.username,
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
                        Text(currentProfile.email,
                            style: Theme.of(vm.context).textTheme.bodyLarge!),
                        const SizedBox(height: 16),
                        Text("Телефон",
                            style: Theme.of(vm.context).textTheme.labelMedium!),
                        Text(currentProfile.phoneNumber == null ? "—" : currentProfile.phoneNumber!,
                            style: Theme.of(vm.context).textTheme.bodyLarge!),
                        const SizedBox(height: 487),
                      ],
                    ),
                  ),
                ),
              );
            },
          ));
  }

  @override
  Widget build(ProfileViewModel vm) {
    return Scaffold(
      appBar: _profileAppBar(vm: vm),
      body: _personalProfileBody(vm: vm)
    );
  }
}
