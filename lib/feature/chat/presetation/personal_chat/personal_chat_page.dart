import 'dart:developer';
import 'package:anime_hub/core/data/firebase_services/model/user_model.dart';
import 'package:anime_hub/core/data/firebase_services/model/user_model_with_last_message.dart';
import 'package:anime_hub/feature/chat/presetation/personal_chat/personal_chat_view_model.dart';
import 'package:anime_hub/theme/theme_colors.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/data/firebase_services/model/message_model.dart';
import '../../../../core/domain/router/router.gr.dart';
import '../../../../core/presentation/view/view_model.dart';
import '../../../../generated/l10n.dart';
import '../../../anime/presetation/widget/error_list_widget.dart';
import '../../domain/repository/chat_and_auth_repository.dart';

@RoutePage()
class PersonalChatPage extends BaseView<PersonalChatViewModel> {
  final String receiverUsername;
  final UserModelWithLastMessage userModel;
  final String receiverId;

  PersonalChatPage({
    super.key,
    required this.receiverUsername,
    required ChatAndAuthRepository chatAndAuthRepository,
    required this.receiverId,
    required this.userModel,
  }) : super(
            vmFactory: (context) => PersonalChatViewModel(context,
                chatAndAuthRepository: chatAndAuthRepository));

  final TextEditingController _messageTextController = TextEditingController();

  Future<void> sendMessage({required PersonalChatViewModel vm}) async {
    if (_messageTextController.text.isNotEmpty) {
      log(receiverId);
      vm.sendMessageUseCase
          .call(receiverID: receiverId, message: _messageTextController.text);
      _messageTextController.clear();
    }
  }

  Widget _chatBubble(
      {required bool isCurrentUser,
      required String message,
      required double maxWidth}) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth * 0.75,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: isCurrentUser
                ? LightThemeColors.sendMessageColor
                : Colors.grey[200],
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: Text(message),
      ),
    );
  }

  Widget _messageItemWidget(
      {required DocumentSnapshot doc,
      required PersonalChatViewModel vm,
      required double maxWidth}) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final MessageModel messageModel = MessageModel.fromJson(data);
    final currentUser = vm.getCurrentUserUseCase.call();
    bool isCurrentUser = messageModel.senderID == currentUser!.uid;
    final alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        alignment: alignment,
        child: _chatBubble(
            isCurrentUser: isCurrentUser,
            message: messageModel.message,
            maxWidth: maxWidth));
  }

  Widget _messageWidget(
      {required PersonalChatViewModel vm, required double maxWidth}) {
    String senderId = vm.getCurrentUserUseCase.call()!.uid;
    return StreamBuilder(
        stream: vm.getMessageUseCase
            .call(userId: senderId, otherUserId: receiverId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorListWidget(
              titleError: S.of(context).title_error,
              descriptionError: S.of(context).no_internet,
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting &&
              vm.isFirstTime) {
            vm.isFirstTime = false;
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          log(snapshot.data!.docs.toString());
          Future.delayed(
              const Duration(milliseconds: 500),
                  () => vm.scrollDown());

          return ListView(
            controller: vm.scrollController,
            children: snapshot.data!.docs
                .map((doc) =>
                    _messageItemWidget(doc: doc, vm: vm, maxWidth: maxWidth))
                .toList(),
          );
        });
  }

  Widget _myCustomTextWidget(
      {required double maxWidth, required PersonalChatViewModel vm}) {
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4, top: 6),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
            icon: const Icon(
              Icons.add,
            ),
            onPressed: () {},
          ),
          SizedBox(
              width: maxWidth - 100,
              height: 50,
              child: TextField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), hintText: "Сообщение"),
                focusNode: vm.myFocusNode,
                textAlignVertical: TextAlignVertical.center,
                controller: _messageTextController,
              )),
          IconButton(
            icon: const Icon(
              Icons.send,
            ),
            onPressed: () {
              sendMessage(vm: vm);
              Future.delayed(
                  const Duration(milliseconds: 300), () => vm.fastScrollDown());
            },
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(PersonalChatViewModel vm) {
    final maxWidth = MediaQuery.of(vm.context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        surfaceTintColor: CupertinoColors.white,
        // shadowColor: Colors.white,
        backgroundColor: CupertinoColors.white,

        title: Center(
          child: GestureDetector(
            child: Row(
              children: [
                SizedBox(
                  height: 45,
                  width: 45,
                  child: ClipOval(
                    child: Image.network(
                      userModel.profileImageUrl == null
                          ? "https://www.wild-pro.ru/wp-content/uploads/2023/04/no-profile-min.png"
                          : userModel.profileImageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8,),
                Text(receiverUsername),
              ],
            ),
            onTap: (){
    AutoRouter.of(vm.context).push(InterlocutorProfileRoute(userModel: userModel));
    },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _messageWidget(vm: vm, maxWidth: maxWidth)),
          _myCustomTextWidget(maxWidth: maxWidth, vm: vm)
        ],
      ),
    );
  }
}
