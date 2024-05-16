import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:anime_hub/core/domain/router/router.gr.dart';
import 'package:anime_hub/core/domain/use_case_result/use_case_result.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/core/presentation/widget/customAppBar.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../generated/l10n.dart';
import '../../domain/stateManager/favorites/anime_favorites_notifier.dart';
import '../widget/anime_list_builder_widget.dart';
import '../widget/empty_list_widget.dart';
import '../widget/error_list_widget.dart';
import 'favorite_anime_vm.dart';


@RoutePage()
class FavoriteAnimePage extends BaseView<FavoriteAnimeViewModel> {
   FavoriteAnimePage({super.key, required  ScrollController controller}): super(
    vmFactory: (context) => FavoriteAnimeViewModel(
        context,
        controller: controller,
        animeBoardRepository: AppContainer().repositoryScope.animeRepository)
  );

  void _customAppBarOnPressed({required BuildContext context}) {
    AutoRouter.of(context).push(AnimeFavoritesSearch());
  }

  @override
  Widget build(FavoriteAnimeViewModel vm) {
    final isNotHorizontal =
        MediaQuery.of(vm.context).orientation != Orientation.landscape;
    return Scaffold(
        appBar: isNotHorizontal
            ? CustomAppBar(
                titleAppBar: S.of(vm.context).title_favorite,
                context: vm.context,
                onPressesCallBack: () {
                  _customAppBarOnPressed(context: vm.context);
                },
              )
            : null,
        body: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ref.read(animeFavoritesProvider.notifier).getDataFromDb(
              getAnimeListFunction: vm.getAnimeListFromDbUseCase.call);
          return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final animeApiList = ref.watch(animeFavoritesProvider);
              switch (animeApiList) {
                case null:
                  return const CircularProgressIndicator();
                case GoodUseCaseResult<List<AnimeApiItem>>(:final data):
                  if (data.isNotEmpty) {
                    return AnimeListBuilderWidget(
                      isNotHorizontal: isNotHorizontal,
                      controller: vm.controller,
                      animeList: data,
                      context: vm.context,
                    );
                  } else {
                    return EmptyListWidget(
                      iconData: Icons.list_alt,
                      titleEmptyList: S.of(context).empty_favorites_title,
                      descriptionEmptyList:
                          S.of(context).empty_favorites_description,
                    );
                  }
                case BadUseCaseResult<List<AnimeApiItem>>():
                  return ErrorListWidget(
                    titleError: S.of(context).title_error,
                    descriptionError: S.of(context).favorites_error,
                  );
                default:
                  return const Center(child: CircularProgressIndicator());
              }
            },
          );
        }));
  }
}
