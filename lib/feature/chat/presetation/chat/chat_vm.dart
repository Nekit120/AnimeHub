import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/chat/domain/useCase/get_current_user_by_uid_use_case.dart';
import 'package:anime_hub/feature/chat/domain/useCase/get_last_message_use_case.dart';
import 'package:anime_hub/feature/chat/domain/useCase/get_user_with_last_message_use_case.dart';
import 'package:anime_hub/feature/chat/domain/useCase/sign_out_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';
import '../../../../core/data/firebase_services/model/user_model.dart';
import '../../../../core/presentation/controllers/app_text_editing_controller.dart';
import '../../../../core/presentation/controllers/password_text_editing_controller.dart';
import '../../../../theme/theme_colors.dart';
import '../../domain/repository/chat_and_auth_repository.dart';
import '../../domain/useCase/get_current_user_use_case.dart';
import '../../domain/useCase/get_users_stream_use_case.dart';
import '../../domain/useCase/sign_in_with_email_use_case.dart';

class ChatViewModel extends ViewModel {
  final SignInWithEmailUseCase _signInWithEmailUseCase;
  final GetUsersStreamUseCase getUsersStreamUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final GetCurrentUserByUidUseCase getCurrentUserByUidUseCase;
  final GetLastMessageUseCase getLastMessageUseCase;
  final GetUserWithLastMessageUseCase getUserWithLastMessageUseCase;
  // MessageModel? lastMessageModel;
  final Rv<UserModel?> currentUserModel = null.rv();
  final Rv<bool> isCheckSearch = false.rv;

  ChatViewModel(super.context,
      {required ChatAndAuthRepository chatAndAuthRepository})
      : _signInWithEmailUseCase = SignInWithEmailUseCase(
            chatAndAuthRepository: chatAndAuthRepository),
        _signOutUseCase =
            SignOutUseCase(chatAndAuthRepository: chatAndAuthRepository),
        getUsersStreamUseCase =
            GetUsersStreamUseCase(chatAndAuthRepository: chatAndAuthRepository),
  getLastMessageUseCase = GetLastMessageUseCase(chatAndAuthRepository: chatAndAuthRepository),
  getCurrentUserUseCase = GetCurrentUserUseCase(chatAndAuthRepository: chatAndAuthRepository),
        getUserWithLastMessageUseCase = GetUserWithLastMessageUseCase(chatAndAuthRepository: chatAndAuthRepository),
        getCurrentUserByUidUseCase = GetCurrentUserByUidUseCase(chatAndAuthRepository: chatAndAuthRepository);

  final passwordTextCtrl = PassTextEditingController();
  final emailTextCtrl = AppTextEditingController();
  final isButtonActive = false.rv;

  void _buttonPossibilityListener() {
    if (passwordTextCtrl.text.length > 7 && emailTextCtrl.text.isNotEmpty) {
      isButtonActive.value = true;
    } else {
      isButtonActive.value = false;
    }
  }

  Future<void> signOut() async {
    _signOutUseCase.call();
  }

  // Future<void> getLastMessageModel({required String userId, required String otherUserId}) async {
  //   lastMessageModel = await getLastMessageUseCase(userId: userId,otherUserId: otherUserId);
  // }

  void customSnackBarShow({required String title, required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
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

  Future<void> signIn() async {
    final result = await _signInWithEmailUseCase.call(
        email: emailTextCtrl.text, password: passwordTextCtrl.text);
    switch (result) {
      case GoodUseCaseResult<UserCredential>():
        {
          break;
        }
      case BadUseCaseResult<UserCredential>(:final errorList):
        {
          if(errorList.first.code == "type 'Null' is not a subtype of type 'String'") {

          } else {
            customSnackBarShow(title: errorList.first.code, isError: true);
          }
          break;
        }
    }
  }

  Future<void> getUser({required String uid, required ChatViewModel vm}) async {
    vm.currentUserModel.value =
    await vm.getCurrentUserByUidUseCase.call(uid: uid);
  }

  Future<UserModel?>  getCurrentUserByUid() async {
    final User? user = getCurrentUserUseCase.call();
    return   await getCurrentUserByUidUseCase.call(uid:user!.uid);
  }

  @override
  void initState() {
    super.initState();
    passwordTextCtrl.addListener(_buttonPossibilityListener);
    emailTextCtrl.addListener(_buttonPossibilityListener);
  }

  @override
  void dispose() {
    passwordTextCtrl.removeListener(_buttonPossibilityListener);
    emailTextCtrl.removeListener(_buttonPossibilityListener);
    super.dispose();
  }
}
