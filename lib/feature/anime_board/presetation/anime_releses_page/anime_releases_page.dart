import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/anime_board/domain/model/anime_api_list.dart';
import 'package:anime_hub/feature/anime_info/presetration/anime_info_vm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/router/router.gr.dart';
import '../../../../core/domain/use_case_result/use_case_result.dart';
import '../../../../generated/l10n.dart';
import '../../../../main.dart';
import '../../../../theme/theme_colors.dart';
import '../../domain/stateManager/anime_api_list_notifier.dart';
import 'anime_releases_vm.dart';

@RoutePage()
class AnimeReleasesPage extends BaseView<AnimeReleasesViewModel> {
  const AnimeReleasesPage({super.key, required super.vmFactory});

  AppBar _profileAppBar({required AnimeReleasesViewModel vm}) => AppBar(
        title: Text(S.of(vm.context).title_watch),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {}),
          IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {}),
        ],
      );
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
                    color: LightThemeColors.mdThemeLightSecondaryTwoContainer,
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
    return Scaffold(
      appBar: _profileAppBar(vm: vm),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          ref.read(animeApiListProvider.notifier).fetchData(getAnimeListFunction: vm.getAnimeListUseCase.call);
          return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final animeApiList = ref.watch(animeApiListProvider);
              switch (animeApiList) {
                case GoodUseCaseResult<AnimeApiList>(:final data):
                  return GridView.builder(
                    controller: vm.controller,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.67,
                    ),
                    itemCount: data.results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: Column(
                          children: [
                            Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: SizedBox(
                                child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                    child: Image.network(
                                      data.results[index].materialData?.posterUrl ??
                                          "https://shikimori.one/system/animes/original/56838.jpg",
                                      height: 255,
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                            ),
                            Text(data.results[index].title,
                                maxLines: 2, textAlign: TextAlign.center)
                          ],
                        ),
                        onTap: () {
                          AutoRouter.of(vm.context).push(AnimeInfoRoute(
                              animeItem: data.results[index],
                              vmFactory: (context) => AnimeInfoViewModel(context)));
                        },
                      );
                    },
                  );
                case null:
                  return const Center(child: CircularProgressIndicator());
                case BadUseCaseResult<AnimeApiList>():
                  return _errorFavoritesBoard(context: vm.context);
                default: return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}
