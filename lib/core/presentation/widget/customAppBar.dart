import 'package:anime_hub/core/domain/container/app_container.dart';
import 'package:anime_hub/feature/anime/presetation/widget/filter_item/filter_vm.dart';
import 'package:flutter/material.dart';

import '../../../feature/anime/presetation/widget/filter_item/filter_Item_bottom_sheet.dart';

class CustomAppBar extends AppBar {
  final String titleAppBar;
  final BuildContext context;
  final bool filter;
  final VoidCallback onPressesCallBack;

  @override
  final Widget? leading;

  CustomAppBar(
      {super.key,
      required this.titleAppBar,
      required this.context,
      required this.filter,
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
          title:
              Text(titleAppBar, style: Theme.of(context).textTheme.titleLarge),
          actions: [
            filter ==true ?
            IconButton(
                icon: const Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => FilterItemBottomSheet(vmFactory: (BuildContext context) => FilterViewModel(context, animeBoardRepository: AppContainer().repositoryScope.animeRepository ),),
                    showDragHandle: true,
                  );

                })
                : Container(),
            IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: () {
                  onPressesCallBack();
                }),

          ],
        );
}
