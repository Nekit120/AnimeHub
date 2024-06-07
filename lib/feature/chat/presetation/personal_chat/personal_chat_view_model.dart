import 'dart:developer';

import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/chat/domain/useCase/get_current_user_use_case.dart';
import 'package:anime_hub/feature/chat/domain/useCase/send_invite_use_case.dart';
import 'package:anime_hub/feature/chat/domain/useCase/send_message_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactive_variables/reactive_variables.dart';

import '../../../../core/data/firebase_services/model/user_model.dart';
import '../../../../core/data/firebase_services/model/user_model_with_last_message.dart';
import '../../domain/repository/chat_and_auth_repository.dart';
import '../../domain/useCase/get_current_user_by_uid_use_case.dart';
import '../../domain/useCase/get_message_use_case.dart';

class PersonalChatViewModel extends ViewModel {
  final GetMessageUseCase getMessageUseCase;
  GetCurrentUserUseCase getCurrentUserUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final SendInviteUseCase sendInviteUseCase;
  final GetCurrentUserByUidUseCase getCurrentUserByUidUseCase;
  final UserModelWithLastMessage otherUserModel;

  final String receiverId;
  var isFirstTime = true;
  bool isDialogShowing = false;
  var isFirstShowDialog = true;
  BuildContext? currentContext;
  final isLoaded = false.rv;
  final isActive = false.rv;
  int dialogCount = 1;
  final myFocusNode = FocusNode();
  final Rv<bool?> isFriend = null.rv();

  PersonalChatViewModel(super.context,
      {required ChatAndAuthRepository chatAndAuthRepository,
      required this.otherUserModel,
      required this.receiverId})
      : sendInviteUseCase =
            SendInviteUseCase(chatAndAuthRepository: chatAndAuthRepository),
        getMessageUseCase =
            GetMessageUseCase(chatAndAuthRepository: chatAndAuthRepository),
        sendMessageUseCase =
            SendMessageUseCase(chatAndAuthRepository: chatAndAuthRepository),
        getCurrentUserByUidUseCase = GetCurrentUserByUidUseCase(
            chatAndAuthRepository: chatAndAuthRepository),
        getCurrentUserUseCase =
            GetCurrentUserUseCase(chatAndAuthRepository: chatAndAuthRepository);

  final scrollController = ScrollController();

  void scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1300),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  Future<UserModel?> getCurrentUserByUid() async {
    final User? user = getCurrentUserUseCase.call();
    return await getCurrentUserByUidUseCase.call(uid: user!.uid);
  }

  void fastScrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }

  Future<void> checkIsFriend() async {
    final user = await getCurrentUserByUid();
    if (user != null && user.friends != null) {
      log ("i'm here 1");
      if (user.friends!.contains(receiverId)) {
        log ("i'm here 2");
        isFriend.value =false ;
      } else {
        log ("i'm here 3");
        isFriend.value = true;
      }
    } else {
      log ("i'm here 4");
      isFriend.value = true;
    }
  }

  @override
  void initState() {
    super.initState();
    scrollToBottom();
    checkIsFriend();
    Future.delayed(const Duration(milliseconds: 500), () => fastScrollDown());

    myFocusNode.addListener(() {
      Future.delayed(const Duration(milliseconds: 500), () => scrollDown());
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
}
