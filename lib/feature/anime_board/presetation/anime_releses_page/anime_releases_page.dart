import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/anime_board/presetation/widget/anime_list_builder_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/model/anime_api_list.dart';
import '../../../../core/domain/use_case_result/use_case_result.dart';
import '../../../../core/presentation/widget/customAppBar.dart';
import '../../../../generated/l10n.dart';
import '../../../../theme/theme_colors.dart';
import '../../domain/stateManager/releases/anime_releases_notifier.dart';
import 'anime_releases_vm.dart';

@RoutePage()
class AnimeReleasesPage extends BaseView<AnimeReleasesViewModel> {
  const AnimeReleasesPage({super.key, required super.vmFactory});

  Widget _errorFavoritesBoard({required BuildContext context}) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                const SizedBox(
                    width: 120.0,
                    height: 120.0,
                    child: Icon(Icons.error,
                        color:
                            LightThemeColors.mdThemeLightSecondaryTwoContainer,
                        size: 120)),
                const SizedBox(height: 16),
                Text("Произошла ошибка",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                Text("Возможно вам стоит проверить подключение к интернету",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(AnimeReleasesViewModel vm) {
    final isNotHorizontal =
        MediaQuery.of(vm.context).orientation != Orientation.landscape;
    return Scaffold(
      appBar: isNotHorizontal
          ? CustomAppBar(
              titleAppBar: S.of(vm.context).title_watch,
              context: vm.context,
            )
          : null,
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ref.read(animeReleasesApiProvider.notifier).getDataFromApi(
              getAnimeListFunction: vm.getAnimeListUseCase.call);
          return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final animeApiList = ref.watch(animeReleasesApiProvider);
              switch (animeApiList) {
                case GoodUseCaseResult<AnimeApiList>(:final data):
                  return  AnimeListBuilderWidget(
                        isNotHorizontal: isNotHorizontal,
                        controller:  vm.controller ,
                        animeList: data.results,
                        context: vm.context,
                      );
                //AnimeListBuilderWidget(isNotHorizontal: isNotHorizontal, animeList: data.results, controller: vm.controller, context: vm.context );
                case null:
                  return const Center(child: CircularProgressIndicator());
                case BadUseCaseResult<AnimeApiList>():
                  return _errorFavoritesBoard(context: vm.context);
                default:
                  return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}
