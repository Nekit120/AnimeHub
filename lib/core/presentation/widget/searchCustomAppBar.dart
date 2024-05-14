import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../feature/anime_board/presetation/anime_search/anime_search_vm.dart';
import '../../domain/router/router.gr.dart';

class SearchCustomAppBar extends AppBar {
  final String titleAppBar;
  final BuildContext context;
  final VoidCallback onPressesCallBack;

  @override
  final Widget? leading;

  SearchCustomAppBar(
      {super.key,
      required this.titleAppBar,
      required this.context,
      required this.onPressesCallBack,
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
          title: Text(titleAppBar, style: Theme.of(context).textTheme.titleLarge),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.settings,
                ),
                onPressed: () {onPressesCallBack();}),
          ],
        );
}
