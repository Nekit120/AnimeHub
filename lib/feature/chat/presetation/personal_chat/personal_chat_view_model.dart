import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/chat/domain/useCase/get_current_user_use_case.dart';
import 'package:anime_hub/feature/chat/domain/useCase/send_message_use_case.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/repository/chat_and_auth_repository.dart';
import '../../domain/useCase/get_message_use_case.dart';

class PersonalChatViewModel extends ViewModel {
  final GetMessageUseCase getMessageUseCase;
  GetCurrentUserUseCase getCurrentUserUseCase;
  final SendMessageUseCase sendMessageUseCase;
  var isFirstTime = true;
  final myFocusNode =FocusNode();

  PersonalChatViewModel(super.context,
      {required ChatAndAuthRepository chatAndAuthRepository})
      : getMessageUseCase =
            GetMessageUseCase(chatAndAuthRepository: chatAndAuthRepository),
        sendMessageUseCase =
            SendMessageUseCase(chatAndAuthRepository: chatAndAuthRepository),
  getCurrentUserUseCase =  GetCurrentUserUseCase(chatAndAuthRepository: chatAndAuthRepository);

  final scrollController = ScrollController();

  void scrollDown() {
     scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
  }

  void fastScrollDown() {
     scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds:  700), curve: Curves.fastLinearToSlowEaseIn);
  }



  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(milliseconds: 300),
            () => fastScrollDown()
    );

    myFocusNode.addListener(() {
      if( myFocusNode.hasFocus) {
      Future.delayed(
        const Duration(milliseconds: 600),
          () => scrollDown()
      );
      }});

  }
  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
}
