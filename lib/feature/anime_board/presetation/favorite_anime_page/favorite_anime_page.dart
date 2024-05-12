import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/core/presentation/widget/customAppBar.dart';
import 'package:anime_hub/feature/anime_board/domain/stateManager/favorites/anime_fovorites_notifier.dart';
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../generated/l10n.dart';
import '../widget/anime_list_builder_widget.dart';

@RoutePage()
class FavoriteAnimePage extends BaseView<FavoriteAnimeViewModel> {
  const FavoriteAnimePage({super.key, required super.vmFactory});
  @override
  Widget build(FavoriteAnimeViewModel vm) {
    final isNotHorizontal =
        MediaQuery.of(vm.context).orientation != Orientation.landscape;
    return Scaffold(
        appBar: isNotHorizontal
            ? CustomAppBar(
                titleAppBar: S.of(vm.context).title_favorite,
                context: vm.context,
              )
            : null,
        body: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ref.read(animeFavoritesProvider.notifier).getDataFromDb(getAnimeListFunction: vm.getAnimeListFromDbUseCase.call);
         return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final animeApiList = ref.watch(animeFavoritesProvider);
              switch (animeApiList) {
                case null:
                  return Container();
                case GoodUseCaseResult<List<AnimeApiItem>>(:final data):
                  return  AnimeListBuilderWidget(
                      isNotHorizontal: isNotHorizontal,
                      controller:  vm.controller,
                      animeList: data,
                      context: vm.context,
                    );
                case BadUseCaseResult<List<AnimeApiItem>>():
                  return Container();
                default: return const Center(child: CircularProgressIndicator());
              }
            },
          );

        }));
  }
}
