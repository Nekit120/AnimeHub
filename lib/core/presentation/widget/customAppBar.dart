import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../feature/anime_board/presetation/anime_search/anime_search_vm.dart';
import '../../domain/router/router.gr.dart';

class CustomAppBar extends AppBar {
  final String titleAppBar;
  final BuildContext context;

  @override
  final Widget? leading;

  CustomAppBar(
      {super.key,
      required this.titleAppBar,
      required this.context,
      this.leading})
      : super(

    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
          leading: leading ??
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_outlined)),
          title:
              Text(titleAppBar, style: Theme.of(context).textTheme.titleLarge),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: () {
                  if(ModalRoute.of(context)?.settings.name != "AnimeSearch"){
                    AutoRouter.of(context).push(AnimeSearch(
                        vmFactory: (context) => AnimeSearchViewModel(context,
                            animeBoardRepository: AppContainer()
                                .repositoryScope
                                .animeBoardRepository,
                     )));
                  }

                }),
            IconButton(
                icon: const Icon(
                  Icons.settings,
                ),
                onPressed: () {}),
          ],
        );
}
