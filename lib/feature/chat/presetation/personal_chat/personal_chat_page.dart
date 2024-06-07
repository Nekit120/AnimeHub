import 'dart:developer';
import 'package:anime_hub/core/data/firebase_services/model/user_model_with_last_message.dart';
import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/feature/chat/presetation/personal_chat/personal_chat_view_model.dart';
import 'package:anime_hub/feature/player/presentation/share_payer_page.dart';
import 'package:anime_hub/theme/theme_colors.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/data/firebase_services/chat/chat_sevice.dart';
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
    required UserModelWithLastMessage userModel,
    required String receiverId,
  })  : userModel = userModel,
        receiverId = receiverId,
        super(
          vmFactory: (context) => PersonalChatViewModel(context,
              chatAndAuthRepository: chatAndAuthRepository,
              otherUserModel: userModel,
              receiverId: receiverId));

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
    if (currentUser != null) {
      bool isCurrentUser = messageModel.senderID == currentUser!.uid;

      final alignment =
      isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
      return Container(
          alignment: alignment,
          child: _chatBubble(
              isCurrentUser: isCurrentUser,
              message: messageModel.message,
              maxWidth: maxWidth));
    } else {
      return Container();
    }
  }

  Widget _messageWidget(
      {required PersonalChatViewModel vm, required double maxWidth}) {
    final sender = vm.getCurrentUserUseCase.call();
    if (sender != null) {
      String senderId = sender.uid;
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
          Future.delayed(
              const Duration(milliseconds: 600), () => vm.scrollDown());
          if (snapshot.data != null) {
            return ListView.builder(
              reverse: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var doc = snapshot.data!.docs[index];
                return _messageItemWidget(doc: doc, vm: vm, maxWidth: maxWidth);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    } else {
      return Container();
    }
  }

  Widget _myCustomTextWidget(
      {required double maxWidth, required PersonalChatViewModel vm}) {
    return Material(
      elevation: 30,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[400]!, // Цвет и толщина линии
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2, top: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                    border: InputBorder.none,
                    hintText: "Сообщение",
                  ),
                  focusNode: vm.myFocusNode,
                  textAlignVertical: TextAlignVertical.center,
                  controller: _messageTextController,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.send,
                ),
                onPressed: () {
                  vm.isFirstShowDialog = true;
                  sendMessage(vm: vm);
                  Future.delayed(
                    const Duration(milliseconds: 300),
                        () => vm.fastScrollDown(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void customSnackBarShow(
      {required String title,
        required bool isError,
        required PersonalChatViewModel vm}) {
    ScaffoldMessenger.of(vm.context).showSnackBar(
      SnackBar(
        content: Center(child: Text(title)),
        duration: const Duration(milliseconds: 2000),
        backgroundColor: isError ? LightThemeColors.seed : Colors.green[500],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  final ChatFirebaseService chatFirebaseService = ChatFirebaseService();

  void showInviteDialog(
      {
        required String animeName,
        required String acceptId,
        required String proposedId,
        required PersonalChatViewModel vm}) {
    vm.dialogCount++;
    vm.isFirstShowDialog = false;
    showDialog(
      context: vm.context,
      builder: (BuildContext context) {
        vm.currentContext = context;
        return AlertDialog(
          title: const Text(
            "Вам пришёл запрос на просмотр",
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text("Вы хотите посмотреть \"${animeName}\" ?")],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: const Text('Да'),
                  onPressed: () {
                    vm.dialogCount = 0;
                    vm.isFirstShowDialog = true;
                    AutoRouter.of(context).pop();
                    Future.delayed(
                        const Duration(milliseconds: 500),
                            () => chatFirebaseService.updatePositiveInviteAfterSend(
                            acceptId: acceptId, proposedId: proposedId));
                  },
                ),
                TextButton(
                  child: const Text('Нет'),
                  onPressed: () {
                    vm.dialogCount = 0;
                    vm.isFirstShowDialog = true;
                    AutoRouter.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
  String lastChoise = " ";
  void listenForOffers(
      {required String currentUserId,
        required String acceptId,
        required PersonalChatViewModel vm}) {
    String senderId = vm.getCurrentUserUseCase.call()!.uid;
    chatFirebaseService
        .offerStream(currentUserId: senderId, acceptId: receiverId)
        .listen((offer) {

      if (offer != null) {
        if (offer.isProposed == true &&
            offer.isAccepted == false &&
            senderId == offer.proposedId) {
          chatFirebaseService.updateInviteAfterSend(
            acceptId: senderId,
            proposedId: receiverId,
          );
          if(vm.isFirstShowDialog == true) {
            vm.dialogCount = 0;
            vm.isFirstShowDialog = false;
            lastChoise = offer.animeLink;
            showInviteDialog(
                animeName: offer.animeName,
                acceptId: senderId,
                proposedId: receiverId, vm: vm);
          } else {
            if(vm.dialogCount==1){
              if (lastChoise == offer.animeLink) {

              }else {
                AutoRouter.of(vm.context).pop();
                vm.dialogCount--;
                Future.delayed(const Duration(milliseconds: 150), () =>
                    showInviteDialog(
                        animeName: offer.animeName,
                        acceptId: senderId,
                        proposedId: receiverId, vm: vm));
                lastChoise =offer.animeLink;
              }

            }

          }
        } else if (offer.isProposed == true && offer.isAccepted == true) {
          chatFirebaseService.updateInviteAfterSend(
            acceptId: senderId,
            proposedId: receiverId,
          );
          vm.dialogCount--;
          AutoRouter.of(vm.context).replace(SharePlayerRoute(
              animeStreamUrl: offer.animeLink,
              receiverUsername: receiverUsername,
              receiverId: receiverId,
              userModel: userModel));
        }
      } else {}
    });
  }

  @override
  Widget build(PersonalChatViewModel vm) {
    // userId: userModel.uid, otherUserId: receiverId
    listenForOffers(
      currentUserId: userModel.uid,
      acceptId: receiverId,
      vm: vm,
    );
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
                const SizedBox(
                  width: 8,
                ),
                Text(receiverUsername),
              ],
            ),
            onTap: () {
              AutoRouter.of(vm.context)
                  .push(InterlocutorProfileRoute(userModel: userModel));
            },
          ),
        ),
        actions: [
          vm.isFriend.observer((context, value) => value != null
              ? value == false
              ? IconButton(
            icon: const Icon(
              Icons.person,
              size: 25,
            ),
            onPressed: () {
              final sender = vm.getCurrentUserUseCase.call();
              chatFirebaseService.removeFriend(
                  userId: sender!.uid, friendUid: receiverId);
              vm.isFriend.value = true;
            },
          )
              : IconButton(
            icon: const Icon(
              Icons.person_outline,
              size: 25,
            ),
            onPressed: () {
              final sender = vm.getCurrentUserUseCase.call();
              chatFirebaseService.addFriend(
                  userId: sender!.uid, friendUid: receiverId);
              vm.isFriend.value = false;
            },
          )
              : Container()),
          IconButton(
            icon: const Icon(
              Icons.tv,
            ),
            onPressed: () {
              AutoRouter.of(vm.context).replace(SendAnimeInviteRoute(
                animeRepository: AppContainer().repositoryScope.animeRepository,
                chatAndAuthRepository:
                AppContainer().repositoryScope.chatAndAuthRepository,
                acceptId: receiverId,
                proposedId: userModel.uid,
                receiverId: receiverId,
                userModel: userModel,
                receiverUsername: receiverUsername,
              ));
            },
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
