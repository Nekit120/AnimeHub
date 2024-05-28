import 'dart:async';
import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/core/presentation/widget/customAppBar.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/model/anime_api_list.dart';
import '../../../../core/presentation/widget/searchCustomAppBar.dart';
import '../../../../generated/l10n.dart';
import '../../domain/stateManager/search/anime_search_notifier.dart';
import '../../domain/stateManager/state/anime_search_state.dart';
import '../widget/anime_list_builder_widget.dart';
import '../widget/empty_list_widget.dart';
import '../widget/error_list_widget.dart';
import 'anime_search_vm.dart';

@RoutePage()
// ignore: must_be_immutable
class AnimeSearch extends BaseView<AnimeSearchViewModel> {
  AnimeSearch({super.key})
      : super(
            vmFactory: (context) => AnimeSearchViewModel(context,
                animeBoardRepository:
                    AppContainer().repositoryScope.animeRepository));

  final TextEditingController textEditingController = TextEditingController();
  Timer _debounceTimer = Timer(const Duration(seconds: 1), () {});

  Widget _customTextField(
      {required bool isNotHorizontal,
      required WidgetRef ref,
      required AnimeSearchViewModel vm}) {
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
  Widget build(AnimeSearchViewModel vm) {
    final isNotHorizontal =
        MediaQuery.of(vm.context).orientation != Orientation.landscape;
    return Scaffold(
        appBar: isNotHorizontal
            ? SearchCustomAppBar(
                titleAppBar: S.of(vm.context).title_search,
                context: vm.context,
                onPressesCallBack: () {},
              )
            : null,
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
                      child: AnimeListBuilderWidget(
                          isNotHorizontal: isNotHorizontal,
                          animeList: animeItemList.data.results,
                          controller: null,
                          context: vm.context, isFavorite: false,),
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
