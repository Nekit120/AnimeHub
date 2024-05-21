import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/core/domain/router/router.gr.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../generated/l10n.dart';
import '../../../../theme/svg_image_collection.dart';
import '../../../../theme/theme_colors.dart';
import '../../domain/repository/chat_and_auth_repository.dart';
import '../../widget/custom_filled_button.dart';
import '../../widget/email_text_field_widget.dart';
import '../../widget/password_text_field_widget.dart';
import 'chat_vm.dart';

@RoutePage()
class ChatPage extends BaseView<ChatViewModel> {
  ChatPage({super.key, required ChatAndAuthRepository chatAndAuthRepository})
      : super(
            vmFactory: (context) =>
                ChatViewModel(context, chatAndAuthRepository: chatAndAuthRepository));

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
  // Widget _buildUserList({required ChatViewModel vm }) {
  //   return StreamBuilder(stream: vm.getUsersStreamUseCase.call(),
  //       builder: (context,snapshot) {
  //       return Center(child: Text("hello"),);
  //       }
  //
  //   );
  // }

  @override
  Widget build(ChatViewModel vm) {
    double maxWidth = MediaQuery.of(vm.context).size.width;
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(child: Text("Чат")),
              actions: [
                IconButton(
                    icon: const Icon(
                      Icons.logout,
                    ),
                    onPressed: vm.signOut,)
              ],
            ),
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
                    EmailTextFieldWidget(
                      controller: vm.emailTextCtrl,
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


