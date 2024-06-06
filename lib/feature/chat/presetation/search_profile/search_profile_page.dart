import 'dart:async';

import 'package:anime_hub/feature/chat/presetation/search_profile/search_profile_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/data/firebase_services/chat/chat_sevice.dart';
import '../../../../core/data/firebase_services/model/user_model_with_last_message.dart';
import '../../../../core/domain/container/app_container.dart';
import '../../../../core/domain/router/router.gr.dart';
import '../../../../core/presentation/view/view_model.dart';
import '../../../../theme/theme_colors.dart';
import '../../../profile/domain/state_manager/profile/profile_notifier.dart';
import '../../widget/user_tile.dart';
import '../chat/chat_vm.dart';

@RoutePage()
class SearchProfilePage extends BaseView<SearchProfilePageViewModel> {
  final String currentUid;

  SearchProfilePage(
      {super.key, required super.vmFactory, required this.currentUid});

  Timer _debounceTimer = Timer(const Duration(seconds: 1), () {});

  Widget _searchInfoWidget(
      {required BuildContext context,
      required String title,
      required String decription,
      required IconData iconData,
      required Color color}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              SizedBox(
                  width: 120.0,
                  height: 120.0,
                  child: Icon(iconData, color: color, size: 120)),
              const SizedBox(height: 16),
              Text(title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              Text(decription,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _customAppBarSearch({required SearchProfilePageViewModel vm}) {
    return AppBar(
      elevation: 1.0,
      shadowColor: Colors.grey[100],
      title: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: TextField(
                controller: vm.appBarController,
                onChanged: (value) {
                  _debounceTimer.cancel();
                  if (value.length > 1) {
                    _debounceTimer =
                        Timer(const Duration(seconds: 1), () async {
                      vm.usersModelWithLastMessage.value =
                          await chatFirebaseService
                              .getUserModelWithLastMessageByName(
                                  currentUserUid: currentUid,
                                  searchTerm: value);
                    });
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Поиск пользователей",
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

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

  Widget _buildUserList(
      {required SearchProfilePageViewModel vm,
      required String uid,
      required List<UserModelWithLastMessage>? usersModel}) {
    return usersModel != null
        ? usersModel.isNotEmpty
            ? ListView(
                children: usersModel!
                    .map<Widget>((userData) => _buildUserListItem(
                          userData: userData,
                          vm: vm,
                        ))
                    .toList(),
              )
            : _searchInfoWidget(
                context: vm.context,
                title: "Пользователь не найден",
                decription:
                    "Попробуйте сохранить регистры ввода и попытаться снова.",
                iconData: Icons.search_off,
                color: LightThemeColors.mdThemeLightError)
        : _searchInfoWidget(
            context: vm.context,
            title: "Поиск пользователей",
            decription:
                "Тут вы можете найти пользователей и добавить в свои контакты!",
            iconData: Icons.search_rounded,
            color: LightThemeColors.positiveCheck);
  }

  Widget _buildUserListItem(
      {required UserModelWithLastMessage userData,
      required SearchProfilePageViewModel vm}) {
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
  Widget build(SearchProfilePageViewModel vm) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return Scaffold(
              appBar: _customAppBarSearch(vm: vm),
              body: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: vm.usersModelWithLastMessage.observer(
                      (context, value) => _buildUserList(
                          vm: vm,
                          uid: snapshot.data!.uid,
                          usersModel: value))));
        });
  }
}
