import 'dart:developer';
import 'dart:ffi';

import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/core/domain/router/router.gr.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/profile/data/repository/profile_repository_impl.dart';
import 'package:anime_hub/feature/profile/domain/repository/profile_repository.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/data/firebase_services/model/user_model.dart';
import '../../../../generated/l10n.dart';
import '../../../../theme/svg_image_collection.dart';
import '../../../../theme/theme_colors.dart';
import '../../../anime/presetation/widget/error_list_widget.dart';
import '../../../profile/domain/state_manager/profile/profile_notifier.dart';
import '../../domain/repository/chat_and_auth_repository.dart';
import '../../widget/custom_filled_button.dart';
import '../../widget/email_text_field_widget.dart';
import '../../widget/password_text_field_widget.dart';
import '../../widget/user_tile.dart';
import 'chat_vm.dart';

@RoutePage()
class ChatPage extends BaseView<ChatViewModel> {
  ChatPage({super.key, required ChatAndAuthRepository chatAndAuthRepository})
      : super(
            vmFactory: (context) => ChatViewModel(context,
                chatAndAuthRepository: chatAndAuthRepository));

  Widget _customDelimiter({required double maxWidth}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: maxWidth / 2 - 50,
        height: 2,
        color: Colors.grey[350],
      ),
    );
  }

  Widget _buildUserList({required ChatViewModel vm}) {
    return StreamBuilder(
        stream: vm.getUsersStreamUseCase.call(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            try {} catch (e) {
              log(e.toString());
            }
            return ErrorListWidget(
              titleError: S.of(context).title_error,
              descriptionError: S.of(context).no_internet,
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!
                .map<Widget>((userData) => _buildUserListItem(
                      userData: userData,
                      vm: vm,
                    ))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      {required UserModel userData, required ChatViewModel vm}) {
    final currentUser = vm.getCurrentUserUseCase();
    if (userData.email != currentUser!.email) {
      return UserTile(
        email: userData.username,
        onTap: () {
          AutoRouter.of(vm.context).push(PersonalChatRoute(
              receiverUsername: userData.username,
              chatAndAuthRepository:
                  AppContainer().repositoryScope.chatAndAuthRepository,
              receiverId: userData.uid));
        }, photoUrl: userData.profileImageUrl,
      );
    } else {
      return Container();
    }
  }


  @override
  Widget build(ChatViewModel vm) {
    double maxWidth = MediaQuery.of(vm.context).size.width;
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            vm.getUser(uid: snapshot.data!.uid, vm: vm);
            return Scaffold(
              appBar: AppBar(
                title: const Center(child: Text("Чат")),
                leading: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                      ref.read(profileProvider.notifier).updateProfile(getAnimeListFunction:  vm.getCurrentUserByUid());
                      return   Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        final currentProfile = ref.watch(profileProvider);
                        return ClipOval(
                            child: currentProfile !=null ? Image.network(
                              currentProfile!.profileImageUrl == null ?  "https://www.wild-pro.ru/wp-content/uploads/2023/04/no-profile-min.png" : currentProfile!.profileImageUrl!,
                              fit: BoxFit.cover,
                            ) :  Container(margin: const EdgeInsets.all(8),child: CircularProgressIndicator()),
                        );
                      },);
                    },) ,
                    onTap: () {
                      AutoRouter.of(context).push(ProfileRoute(
                          profileRepository: AppContainer()
                              .repositoryScope
                              .profileRepository));
                    },
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.logout,
                    ),
                    onPressed: vm.signOut,
                  )
                ],
              ),
              body: _buildUserList(vm: vm),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 160, left: 16, right: 16),
                child: Column(
                  children: [
                    SvgPicture.asset(
                        width: 116,
                        ImageCollectionSVG.iconAppOutline,
                        colorFilter: const ColorFilter.mode(
                          LightThemeColors.mdThemeLightOnSurface,
                          BlendMode.srcIn,
                        )),
                    Text("AnimeHubChat",
                        style: Theme.of(vm.context).textTheme.displayMedium),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextFieldWidget(
                      controller: vm.emailTextCtrl,
                      title: S.of(vm.context).email,
                      isEmail: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PasswordTextFieldWidget(
                      passTextEditingController: vm.passwordTextCtrl,
                      labelText: 'Пароль',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    vm.isButtonActive.observer(
                      (context, value) => CustomFilledButton(
                          isButtonActive: value,
                          titleButton: "Войти",
                          buttonCallback: vm.signIn),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _customDelimiter(maxWidth: maxWidth),
                        Text(
                          "или",
                          style: Theme.of(vm.context).textTheme.headlineSmall,
                        ),
                        _customDelimiter(maxWidth: maxWidth),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: S.of(vm.context).registrationStart,
                            style:
                                Theme.of(vm.context).textTheme.bodyLarge?.apply(
                                      color: Colors.grey[500],
                                    ),
                          ),
                          TextSpan(
                            text: S.of(vm.context).register,
                            style: Theme.of(vm.context).textTheme.headlineLarge,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                AutoRouter.of(vm.context).push(
                                    RegistrationRoute(
                                        chatAndAuthRepository: AppContainer()
                                            .repositoryScope
                                            .chatAndAuthRepository));
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
