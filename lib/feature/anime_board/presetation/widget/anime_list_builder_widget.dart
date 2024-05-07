import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/router/router.gr.dart';
import '../../../anime_info/presetration/anime_info_vm.dart';
import '../../domain/model/anime_api_list.dart';

class AnimeListBuilderWidget extends StatelessWidget {
  final bool isNotHorizontal;
  final AnimeApiList animeList;
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
      itemCount: animeList.results.length,
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
                      child: Image.network(
                        animeList.results[index].materialData?.posterUrl ??
                            "https://shikimori.one/system/animes/original/56838.jpg",
                        height: 255,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Text(animeList.results[index].title,
                  maxLines: 2, textAlign: TextAlign.center)
            ],
          ),
          onTap: () {
            AutoRouter.of(context).push(AnimeInfoRoute(
                animeItem: animeList.results[index],
                vmFactory: (context) => AnimeInfoViewModel(context)));
          },
        );
      },
    );
  }
}
