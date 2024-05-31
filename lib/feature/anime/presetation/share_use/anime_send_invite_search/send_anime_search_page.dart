import 'dart:async';
import 'package:anime_hub/core/data/firebase_services/chat/chat_sevice.dart';
import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/core/presentation/widget/customAppBar.dart';
import 'package:anime_hub/feature/anime/domain/repository/anime_repository.dart';
import 'package:anime_hub/feature/anime/presetation/share_use/anime_send_invite_search/send_seind_ivite_anime_list_builder_widget.dart';
import 'package:anime_hub/feature/chat/domain/repository/chat_and_auth_repository.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/data/firebase_services/model/user_model_with_last_message.dart';
import '../../../../../core/domain/model/anime_api_list.dart';
import '../../../../../core/domain/router/router.gr.dart';
import '../../../../../core/presentation/widget/searchCustomAppBar.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/stateManager/search/anime_search_notifier.dart';
import '../../../domain/stateManager/state/anime_search_state.dart';
import '../../widget/empty_list_widget.dart';
import '../../widget/error_list_widget.dart';
import 'send_anime_search_vm.dart';

@RoutePage()
// ignore: must_be_immutable
class SendAnimeInvitePage extends BaseView<SendAnimeSearchViewModel> {
  final String receiverUsername;
  final UserModelWithLastMessage userModel;
  final String receiverId;

  SendAnimeInvitePage({
    super.key,
    required AnimeRepository animeRepository,
    required ChatAndAuthRepository chatAndAuthRepository,
    required String acceptId,
    required String proposedId,
    required this.receiverId,
    required this.userModel,
    required this.receiverUsername,
  }) : super(
            vmFactory: (context) => SendAnimeSearchViewModel(context,
                animeBoardRepository: animeRepository,
                chatAndAuthRepository: chatAndAuthRepository,
                acceptId: acceptId,
                proposedId: proposedId));

  final TextEditingController textEditingController = TextEditingController();
  Timer _debounceTimer = Timer(const Duration(seconds: 1), () {});

  Widget _customTextField(
      {required bool isNotHorizontal,
      required WidgetRef ref,
      required SendAnimeSearchViewModel vm}) {
    return Padding(
        padding: isNotHorizontal
            ? const EdgeInsets.only(
                right: 12.0, left: 12.0, top: 4.0, bottom: 3.0)
            : const EdgeInsets.only(left: 16.0, right: 16.0, top: 28),
        child: Column(children: [
          SizedBox(
              height: 60,
              child: TextField(
                  controller: textEditingController,
                  onChanged: (value) {
                    _debounceTimer.cancel();
                    if (value.length > 1) {
                      _debounceTimer = Timer(const Duration(seconds: 1), () {
                        ref
                            .read(animeSearchApiProvider.notifier)
                            .findDataByRequest(
                              findAnimeListByRequest:
                                  vm.findAnimeByRequestUseCase.call,
                              title: value,
                            );
                      });
                    }
                  },
                  decoration: InputDecoration(
                      labelText: S.of(vm.context).title_search,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ))))
        ]));
  }

  @override
  Widget build(SendAnimeSearchViewModel vm) {
    final isNotHorizontal =
        MediaQuery.of(vm.context).orientation != Orientation.landscape;
    return Scaffold(
        appBar: isNotHorizontal
            ? AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                AutoRouter.of(vm.context).replace(PersonalChatRoute(
                    receiverUsername: receiverUsername,
                    chatAndAuthRepository: vm.chatAndAuthRepository,
                    receiverId: receiverId,
                    userModel: userModel));
              },
              icon: const Icon(Icons.arrow_back_outlined)),
        ) : null,
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final animeApiList = ref.watch(animeSearchApiProvider);
            switch (animeApiList) {
              case AnimeSearchState(result: null, loading: false):
                return Column(children: [
                  _customTextField(
                    isNotHorizontal: isNotHorizontal,
                    ref: ref,
                    vm: vm,
                  )
                ]);
              case AnimeSearchState(
                  result: GoodUseCaseResult<AnimeApiList> animeItemList,
                  loading: false
                ):
                if (animeItemList.data.results.isNotEmpty) {
                  return Column(children: [
                    _customTextField(
                      isNotHorizontal: isNotHorizontal,
                      ref: ref,
                      vm: vm,
                    ),
                    Expanded(
                      child: SendAnimeListBuilderWidget(
                        isNotHorizontal: isNotHorizontal,
                        animeList: animeItemList.data.results,
                        context: vm.context,
                        isFavorite: false,
                        chatAndAuthRepository: vm.chatAndAuthRepository,
                        proposedId: vm.proposedId,
                        acceptId: vm.acceptId,
                        receiverId: receiverId,
                        userModel: userModel,
                        receiverUsername: receiverUsername,
                      ),
                    )
                  ]);
                } else {
                  return Column(
                    children: [
                      _customTextField(
                        isNotHorizontal: isNotHorizontal,
                        ref: ref,
                        vm: vm,
                      ),
                      EmptyListWidget(
                          iconData: Icons.search_off,
                          titleEmptyList:
                              S.of(context).anime_search_empty_title,
                          descriptionEmptyList:
                              S.of(context).anime_search_empty_description)
                    ],
                  );
                }
              case AnimeSearchState(
                  result: BadUseCaseResult<AnimeApiList>(),
                  loading: false
                ):
                return Column(
                  children: [
                    _customTextField(
                      isNotHorizontal: isNotHorizontal,
                      ref: ref,
                      vm: vm,
                    ),
                    ErrorListWidget(
                        titleError: S.of(context).title_error,
                        descriptionError: S.of(context).no_internet),
                  ],
                );
              case AnimeSearchState(loading: true):
                return Column(children: [
                  _customTextField(
                    isNotHorizontal: isNotHorizontal,
                    ref: ref,
                    vm: vm,
                  ),
                  const Expanded(
                      child: Center(child: CircularProgressIndicator()))
                ]);
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
