import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/anime_board/presetation/anime_new_item_page/anime_releases_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/domain/router/router.gr.dart';
import '../../../../theme/theme_colors.dart';

@RoutePage()
class AnimeNewReleasesPage extends BaseView<AnimeReleasesViewModel> {
  AnimeNewReleasesPage({super.key, required super.vmFactory});


  AppBar get _profileAppBar => AppBar(
    title: Text("Просмотр"),
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
  Widget build(AnimeReleasesViewModel vm) {
    return  Scaffold(
      appBar: _profileAppBar,
      body: Container(
      ),
    );
  }
}
