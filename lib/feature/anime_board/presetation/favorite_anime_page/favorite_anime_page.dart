import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme/theme_colors.dart';

@RoutePage()
class FavoriteAnimePage extends BaseView<FavoriteAnimeViewModel> {
  FavoriteAnimePage({super.key, required super.vmFactory});

  AppBar get _profileAppBar => AppBar(
    title: Text("Любимые"),
    actions: [
      IconButton(
          icon: const Icon(
            Icons.search,
            color: LightThemeColors.mdThemeLightOnSurfaceVariant,
          ),
          onPressed: () { }),
      IconButton(
          icon: const Icon(
            Icons.settings,
            color: LightThemeColors.mdThemeLightOnSurfaceVariant,
          ),
          onPressed: () { }),
    ],
  );
  @override
  Widget build(FavoriteAnimeViewModel vm) {
    return  Scaffold(
      appBar:_profileAppBar ,
      body: Container(
      ),
    );
  }
}
