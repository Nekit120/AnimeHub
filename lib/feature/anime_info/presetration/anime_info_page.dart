import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../generated/l10n.dart';
import '../../../theme/theme_colors.dart';
import '../../anime_board/domain/model/anime_api_item.dart';
import 'anime_info_vm.dart';

@RoutePage()
class AnimeInfoPage extends BaseView<AnimeInfoViewModel> {
  final AnimeApiItem _animeApiItem;

  const AnimeInfoPage(
      {super.key, required AnimeApiItem animeItem, required super.vmFactory})
      : _animeApiItem = animeItem;

  AppBar _profileAppBar({required AnimeInfoViewModel vm}) => AppBar(
        title: Text(S.of(vm.context).title_detailed_information),
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

  Widget genresItem({required List<String> genres,required AnimeInfoViewModel vm }) {
    return SizedBox(
        height: 28,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            genres.length,
                (index) => GestureDetector(
              child: _citiItem(
                  citiName: genres[index],
                  context: vm.context),
            ),
          ),
        ));
  }

  @override
  Widget build(AnimeInfoViewModel vm) {
    return Scaffold(
      appBar: _profileAppBar(vm: vm),
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
                  left: 146,
                  bottom: -64,
                  child: SizedBox(
                    width: 260,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _animeApiItem.materialData?.title?? "Без имени",
                          style: Theme.of(vm.context).textTheme.titleMedium,
                          maxLines: 4,
                        ),
                        Text(
                          _animeApiItem.materialData?.allStatus?? "Без имени",
                          maxLines: 4,
                        ),
                        const SizedBox(height: 6),
                        SizedBox(child: genresItem(genres: _animeApiItem.materialData?.allGenres??[], vm: vm))
                      ],
                    ),
                  ),
                )
              ],
            ),
            // const SizedBox(
            //   height:136,
            // ),
            // Center(child: genresItem(genres: _animeApiItem.materialData?.allGenres??[], vm: vm)),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                _animeApiItem.materialData?.description ??
                    S.of(vm.context).description_error,
              ),
            )
          ],
        ),
      ),
    );
  }
}
