import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/core/domain/model/anime_api_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/domain/router/router.gr.dart';
import '../../../anime_info/presetration/anime_info_vm.dart';

class AnimeListBuilderWidget extends StatelessWidget {
  final bool isNotHorizontal;
  final List<AnimeApiItem> animeList;
  final ScrollController? controller;
  final BuildContext context;
  const AnimeListBuilderWidget({super.key,required this.isNotHorizontal, required this.controller, required  this.animeList,required this.context});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: isNotHorizontal && controller != null ? controller : null,
      gridDelegate: isNotHorizontal
          ? const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 0.67,
            )
          : const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 0.65,
            ),
      itemCount: animeList.length,
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
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: CachedNetworkImage(
                        imageUrl: animeList[index].materialData?.posterUrl ??  "https://shikimori.one/system/animes/original/56838.jpg",
                        height: 255,
                        width: 190,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(child: SizedBox( height: 24,width:24,child: CircularProgressIndicator())),
                      )
                    ),
                ),
              ),
              Text(animeList[index].title,
                  maxLines: 2, textAlign: TextAlign.center)
            ],
          ),
          onTap: () {
            AutoRouter.of(context).push(AnimeInfoRoute(
                vmFactory: (context) => AnimeInfoViewModel(context, animeInfoRepository: AppContainer().repositoryScope.animeInfoRepository, animeItem:animeList[index],)));
          },
        );
      },
    );
  }
}
