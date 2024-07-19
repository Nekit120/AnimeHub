import 'dart:developer';
import 'dart:ffi';
import 'package:anime_hub/core/data/firebase_services/chat/chat_sevice.dart';
import 'package:anime_hub/core/data/firebase_services/model/user_model_with_last_message.dart';
import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/core/domain/router/router.gr.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/chat/presetation/search_profile/search_profile_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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

  Widget _buildUserList({required ChatViewModel vm, required String uid, required double screenWidth}) {
    return StreamBuilder(
        stream: vm.getUserWithLastMessageUseCase.call(currentUserUid: uid),
        // vm.getUsersStreamUseCase.call(),
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

          return  ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) =>
                  Row(
                  children: [
                    SizedBox(width: screenWidth* 0.19,),
                    Expanded(
                      child: Container(
                        height: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
              ),
              itemBuilder: (context, index) =>
              index !=  snapshot.data!.length-1 ?   _buildUserListItem(
                userData: snapshot.data![index],
                vm: vm,
              ) : Column(
                children: [
                  _buildUserListItem(
                    userData: snapshot.data![index],
                    vm: vm,
                  ),
                 Container(
                      height: 0.5,
                      color: Colors.grey[400],
                    ),
                ],
              )
          );
        });
  }

  Widget _buildUserListItem(
      {required UserModelWithLastMessage userData, required ChatViewModel vm}) {
    final currentUser = vm.getCurrentUserUseCase();
    if (userData.email != currentUser!.email) {
      // vm.getLastMessageModel(userId:userData.uid,otherUserId: currentUser!.uid);
      return UserTile(
        email: userData.username,
        onTap: () {
          AutoRouter.of(vm.context).push(PersonalChatRoute(
            receiverUsername: userData.username,
            chatAndAuthRepository:
                AppContainer().repositoryScope.chatAndAuthRepository,
            receiverId: userData.uid,
            userModel: userData,
          ));
        },
        photoUrl: userData.profileImageUrl,
        lastMessageModel: userData,
      );
    } else {
      return Container();
    }
  }

  final ChatFirebaseService chatFirebaseService = ChatFirebaseService();

  Future<void> updateProfile(
      {required WidgetRef ref, required ChatViewModel vm}) async {
    ref
        .read(profileProvider.notifier)
        .updateProfile(getAnimeListFunction: await vm.getCurrentUserByUid());
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
                title: Center(
                    child: Row(
                  children: [
                    SizedBox(width: maxWidth / 3.7),
                    const Text("Чат"),
                  ],
                )),
                leading: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        updateProfile(ref: ref, vm: vm);
                        return Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            final currentProfile = ref.watch(profileProvider);
                            return ClipOval(
                              child: currentProfile != null
                                  ? CachedNetworkImage(
                                      imageUrl: currentProfile!
                                                  .profileImageUrl ==
                                              null
                                          ? "https://www.wild-pro.ru/wp-content/uploads/2023/04/no-profile-min.png"
                                          : currentProfile!.profileImageUrl!,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(),
                            );
                          },
                        );
                      },
                    ),
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
                        Icons.search,
                      ),
                      onPressed: () {
                        AutoRouter.of(context).push(SearchProfileRoute(
                            vmFactory: (context) => SearchProfilePageViewModel(
                                context,
                                chatAndAuthRepository: AppContainer()
                                    .repositoryScope
                                    .chatAndAuthRepository),
                            currentUid: snapshot.data!.uid));
                      }),
                  IconButton(
                    icon: const Icon(
                      Icons.logout,
                    ),
                    onPressed: vm.signOut,
                  )
                ],
              ),
              body: _buildUserList(vm: vm, uid: snapshot.data!.uid,screenWidth: maxWidth),
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
