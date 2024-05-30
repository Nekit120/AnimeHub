import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/chat/domain/useCase/get_current_user_use_case.dart';
import 'package:anime_hub/feature/chat/domain/useCase/send_invite_use_case.dart';
import 'package:anime_hub/feature/chat/domain/useCase/send_message_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactive_variables/reactive_variables.dart';

import '../../domain/repository/chat_and_auth_repository.dart';
import '../../domain/useCase/get_message_use_case.dart';

class PersonalChatViewModel extends ViewModel {
  final GetMessageUseCase getMessageUseCase;
  GetCurrentUserUseCase getCurrentUserUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final SendInviteUseCase sendInviteUseCase;
  var isFirstTime = true;
  var isFirstShowDialog = true;
  BuildContext? currentContext;
  final isLoaded = false.rv;
  int dialogCount = 1;
  final myFocusNode = FocusNode();

  PersonalChatViewModel(super.context,
      {required ChatAndAuthRepository chatAndAuthRepository})
      : sendInviteUseCase =
            SendInviteUseCase(chatAndAuthRepository: chatAndAuthRepository),
        getMessageUseCase =
            GetMessageUseCase(chatAndAuthRepository: chatAndAuthRepository),
        sendMessageUseCase =
            SendMessageUseCase(chatAndAuthRepository: chatAndAuthRepository),
        getCurrentUserUseCase =
            GetCurrentUserUseCase(chatAndAuthRepository: chatAndAuthRepository);

  final scrollController = ScrollController();

  void scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1300),
        curve: Curves.fastLinearToSlowEaseIn);
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

  @override
  void initState() {
    super.initState();
    scrollToBottom();
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
