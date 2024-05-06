import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../feature/anime_board/presetation/anime_search/anime_search_vm.dart';
import '../../domain/router/router.gr.dart';

class CustomAppBar extends AppBar {
  final String titleAppBar;
  final BuildContext context;

  @override
  final Widget? leading;

  CustomAppBar({super.key, required this.titleAppBar, required this.context, this.leading})
      : super(
    leading: leading?? IconButton(
            onPressed: () {Navigator.pop(context); },
            icon: const Icon(Icons.arrow_back_outlined)),
    title: Text(titleAppBar, style: Theme.of(context).textTheme.titleLarge),
    actions:  [
      IconButton(
          icon: const Icon(
            Icons.search,
          ),
          onPressed: () {
            AutoRouter.of(context).push(AnimeSearch(vmFactory:(context) => AnimeSearchViewModel(context)));
          }),
      IconButton(
          icon: const Icon(
            Icons.settings,
          ),
          onPressed: () {}),
    ],
  );
}
