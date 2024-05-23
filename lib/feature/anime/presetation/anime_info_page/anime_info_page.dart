import 'package:anime_hub/core/domain/router/router.gr.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_variables/reactive_variables.dart';
import '../../../../core/domain/container/app_container.dart';
import '../../../../core/domain/model/anime_api_item.dart';
import '../../../../generated/l10n.dart';
import '../../../../theme/theme_colors.dart';
import '../../domain/stateManager/favorites/anime_favorites_notifier.dart';
import 'anime_info_vm.dart';

@RoutePage()
class AnimeInfoPage extends BaseView<AnimeInfoViewModel> {
  final AnimeApiItem animeItem;
  AnimeInfoPage({super.key, required this.animeItem})
      : super(
          vmFactory: (context) => AnimeInfoViewModel(
            context,
            animeRepository:
                AppContainer().repositoryScope.animeRepository,
            animeItem: animeItem,
          ),
        );

  Widget _citiItem({required String citiName, required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      alignment: Alignment.center,
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 12, right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: LightThemeColors.mdThemeLightOnSurfaceVariant,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Text(
              citiName,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _genresItem(
      {required List<String> genres, required AnimeInfoViewModel vm}) {
    return SizedBox(
        height: 28,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            genres.length,
            (index) => GestureDetector(
              child: _citiItem(citiName: genres[index], context: vm.context),
            ),
          ),
        ));
  }

  Widget _customActionButton(
      {required IconData iconData,
      required String actionStr,
      required Function onTapCallback,
      required BuildContext context}) {
    return Material(
      child: InkWell(
        onTap: onTapCallback as void Function()?,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconData),
              Text(actionStr, style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customFavoriteButton(
      {required String actionStr,
      required Function onTapCallback,
      required Widget iconWidget,
      required BuildContext context}) {
    return Material(
      child: InkWell(
        onTap: onTapCallback as void Function()?,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // active
              //     ? const Icon(Icons.favorite)
              //     : const Icon(
              //         Icons.favorite,
              //         color: Colors.red,
              //       ),
              iconWidget,
              Text(actionStr, style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ),
      ),
    );
  }

  void _playTabCallback(
      {required BuildContext context, required String animeStreamUrl}) {
    AutoRouter.of(context).push(PlayerRoute(animeStreamUrl: animeStreamUrl));
  }

  AppBar _infoAppBar({required BuildContext context}) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined)),
      title: Text(S.of(context).title_detailed_information,
          style: Theme.of(context).textTheme.titleLarge),
    );
  }

  @override
  Widget build(AnimeInfoViewModel vm) {

    final maxWidth = MediaQuery.of(vm.context).size.width;
    final maxHeight = MediaQuery.of(vm.context).size.height;
    final isNotHorizontal = MediaQuery.of(vm.context).orientation != Orientation.landscape;
    return Scaffold(
      appBar: AppBar(title: Text(S.of(vm.context).title_detailed_information)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    ClipRRect(
                        child: CachedNetworkImage(
                      imageUrl: vm.animeItem.materialData?.posterUrl ??
                          "https://shikimori.one/system/animes/original/56838.jpg",
                      height:  isNotHorizontal ? maxHeight/5.2 : maxHeight/2.55 ,
                      width: MediaQuery.of(vm.context).size.width,
                      fit: BoxFit.cover,
                    )),
                    Container(
                      height: isNotHorizontal ? maxHeight/6.25 : maxHeight/2.75,
                    ),
                  ],
                ),
                Positioned(
                  left: isNotHorizontal ? 16: maxWidth*0.08,
                  bottom:isNotHorizontal ? 0 : maxHeight/38,
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: SizedBox(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: CachedNetworkImage(
                          imageUrl: vm.animeItem.materialData?.posterUrl ??
                              "https://shikimori.one/system/animes/original/56838.jpg",
                          height: isNotHorizontal ?maxHeight/5.5 :maxHeight/2.6 ,
                          width: isNotHorizontal ? maxWidth/3.55 :maxWidth/7.8,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: isNotHorizontal ? maxWidth/2.7 : maxWidth/4.2,
                  bottom: -65,
                  child: SizedBox(
                    width: isNotHorizontal ? maxWidth/1.54 : maxWidth - maxWidth*0.23,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vm.animeItem.materialData?.title ?? "Без имени",
                          style: Theme.of(vm.context).textTheme.titleMedium,
                          maxLines: 3,
                        ),
                        Text(
                          vm.animeItem.materialData?.allStatus ?? "Без имени",
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                            child: _genresItem(
                                genres:
                                    vm.animeItem.materialData?.allGenres ?? [],
                                vm: vm))
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      return _customFavoriteButton(
                          actionStr: S.of(vm.context).title_favorite,
                          onTapCallback: () {
                            vm.addAnimeInFavorite(vm.animeItem);
                            ref
                                .read(animeFavoritesProvider.notifier)
                                .getDataFromDb(
                                    getAnimeListFunction:
                                        vm.updateAnimeListFromDbUseCase.call);
                          },
                          iconWidget: Obs(
                            rvList: [vm.checkRequest,vm.isFavorite],
                            builder: (BuildContext context) {
                              if (vm.checkRequest.value == true &&
                                  vm.isFavorite == true) {
                                return const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                );
                              } else if (vm.checkRequest.value == true &&
                                  vm.isFavorite == false) {
                                return const Icon(Icons.favorite_outline);
                              } else {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: SizedBox(
                                    height: 4,
                                    width: 24,
                                    child: LinearProgressIndicator(),
                                  ),
                                );
                              }
                            },

                          ),
                          context: vm.context);
                    },
                  ),
                  _customActionButton(
                      iconData: Icons.menu_sharp,
                      actionStr: S.of(vm.context).select_episode,
                      onTapCallback: () {},
                      context: vm.context),
                  _customActionButton(
                      iconData: Icons.play_circle_outline,
                      actionStr: S.of(vm.context).play_text,
                      onTapCallback: () {
                        _playTabCallback(
                          context: vm.context,
                          animeStreamUrl: vm.animeItem.link,
                        );
                      },
                      context: vm.context),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7),
              child: Text(
                vm.animeItem.materialData?.description ??
                    S.of(vm.context).description_error,
                style: Theme.of(vm.context)
                    .textTheme
                    .labelLarge!
                    .apply(fontStyle: FontStyle.italic),
                // style: const TextStyle(
                //   fontStyle: FontStyle.italic
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
