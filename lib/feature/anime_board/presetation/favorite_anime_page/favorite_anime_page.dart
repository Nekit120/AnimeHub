import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

@RoutePage()
class FavoriteAnimePage extends BaseView<FavoriteAnimeViewModel> {
  const FavoriteAnimePage({super.key, required super.vmFactory});

  AppBar _profileAppBar({required FavoriteAnimeViewModel vm}) => AppBar(
        title: Text(S.of(vm.context).title_favorite),
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

  @override
  Widget build(FavoriteAnimeViewModel vm) {
    return Scaffold(
        appBar: _profileAppBar(vm:vm),
        body: Container());
  }
}
