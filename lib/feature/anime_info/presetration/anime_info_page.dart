import 'package:anime_hub/core/domain/router/router.gr.dart';
import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/core/presentation/widget/customAppBar.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../core/domain/model/anime_api_item.dart';
import '../../../generated/l10n.dart';
import '../../../theme/theme_colors.dart';
import 'anime_info_vm.dart';

@RoutePage()
class AnimeInfoPage extends BaseView<AnimeInfoViewModel> {
  final AnimeApiItem _animeApiItem;

  const AnimeInfoPage(
      {super.key, required AnimeApiItem animeItem, required super.vmFactory})
      : _animeApiItem = animeItem;


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
      required bool active,
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
              active
                  ? const Icon(Icons.favorite)
                  : const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
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
      title:
      Text(S.of(context).title_detailed_information, style: Theme.of(context).textTheme.titleLarge),
    );
  }
  @override
  Widget build(AnimeInfoViewModel vm) {
    final isNotHorizontal = MediaQuery.of(vm.context).orientation != Orientation.landscape;
    return Scaffold(
      appBar: CustomAppBar(titleAppBar:S.of(vm.context).title_detailed_information , context: vm.context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        _animeApiItem.materialData?.posterUrl ??
                            "https://shikimori.one/system/animes/original/56838.jpg",
                        height: 180,
                        width: MediaQuery.of(vm.context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 142,
                    ),
                  ],
                ),
                Positioned(
                  left: 16,
                  bottom: 0,
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: SizedBox(
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Image.network(
                            _animeApiItem.materialData?.posterUrl ??
                                "https://shikimori.one/system/animes/original/56838.jpg",
                            height: 160,
                            width: 110,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  bottom: -65,
                  child: SizedBox(
                    width: isNotHorizontal? 257: 725,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _animeApiItem.materialData?.title ?? "Без имени",
                          style: Theme.of(vm.context).textTheme.titleMedium,
                          maxLines: 3,
                        ),
                        Text(
                          _animeApiItem.materialData?.allStatus ?? "Без имени",
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                            child: _genresItem(
                                genres:
                                    _animeApiItem.materialData?.allGenres ?? [],
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
                  _customFavoriteButton(
                      actionStr: S.of(vm.context).title_favorite,
                      onTapCallback: () {vm.insertAnimeItemInUseCase(_animeApiItem);},
                      active: false,
                      context: vm.context),
                  _customActionButton(
                      iconData: Icons.menu_sharp,
                      actionStr: S.of(vm.context).select_episode,
                      onTapCallback: () {},
                      context: vm.context),
                  _customActionButton(
                      iconData: Icons.play_arrow,
                      actionStr: S.of(vm.context).play_text,
                      onTapCallback: () {
                        _playTabCallback(
                          context: vm.context,
                          animeStreamUrl: _animeApiItem.link,
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
                _animeApiItem.materialData?.description ??
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
