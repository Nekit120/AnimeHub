import 'dart:async';
import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/container/app_container.dart';
import '../../../../core/presentation/widget/searchCustomAppBar.dart';
import '../../../../generated/l10n.dart';
import '../../domain/stateManager/favoritesSearch/anime_search_favorites_notifier.dart';
import '../../domain/stateManager/state/anime_search_favorite_state.dart';
import '../widget/anime_list_builder_widget.dart';
import '../widget/empty_list_widget.dart';
import '../widget/error_list_widget.dart';
import 'anime_favorites_search_vm.dart';

@RoutePage()
// ignore: must_be_immutable
class AnimeFavoritesSearch extends BaseView<AnimeFavoritesSearchViewModel> {
  AnimeFavoritesSearch({super.key})
      : super(
          vmFactory: (context) => AnimeFavoritesSearchViewModel(
            context,
            animeRepository:
                AppContainer().repositoryScope.animeRepository,
          ),
        );

  final TextEditingController textEditingController = TextEditingController();
  Timer _debounceTimer = Timer(const Duration(seconds: 1), () {});

  Widget _customTextField(
      {required bool isNotHorizontal,
      required WidgetRef ref,
      required AnimeFavoritesSearchViewModel vm}) {
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
                            .read(animeSearchFavoritesProvider.notifier)
                            .findAnimeInFavorites(
                              findAnimeListByRequest:
                                  vm.findAnimeInFavoritesRequestUseCase.call,
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
  Widget build(AnimeFavoritesSearchViewModel vm) {
    final isNotHorizontal =
        MediaQuery.of(vm.context).orientation != Orientation.landscape;
    return Scaffold(
        appBar: isNotHorizontal
            ? SearchCustomAppBar(
                titleAppBar: "Поиск по любимым",
                context: vm.context,
                onPressesCallBack: () {},
              )
            : null,
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final animeApiList = ref.watch(animeSearchFavoritesProvider);
            switch (animeApiList) {
              case AnimeSearchFavoriteState(result: null, loading: false):
                return Column(children: [
                  _customTextField(
                    isNotHorizontal: isNotHorizontal,
                    ref: ref,
                    vm: vm,
                  )
                ]);
              case AnimeSearchFavoriteState(
                  result: GoodUseCaseResult<List<AnimeApiItem>> animeItemList,
                  loading: false
                ):
                if (animeItemList.data.isNotEmpty) {
                  return Column(children: [
                    _customTextField(
                      isNotHorizontal: isNotHorizontal,
                      ref: ref,
                      vm: vm,
                    ),
                    Expanded(
                      child: AnimeListBuilderWidget(
                          isNotHorizontal: isNotHorizontal,
                          animeList: animeItemList.data,
                          controller: null,
                          context: vm.context),
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
              case AnimeSearchFavoriteState(
                  result: BadUseCaseResult<List<AnimeApiItem>>(),
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
              case AnimeSearchFavoriteState(loading: true):
                return Column(children: [
                  _customTextField(
                    isNotHorizontal: isNotHorizontal,
                    ref: ref,
                    vm: vm,
                  ),
                  const Center(child: CircularProgressIndicator())
                ]);
              default:
                return Center(child: Container());
            }
          },
        ));
  }
}
