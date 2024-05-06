import 'package:anime_hub/core/presentation/view/view_model.dart';
import 'package:anime_hub/core/presentation/widget/customAppBar.dart';
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_vm.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

@RoutePage()
class FavoriteAnimePage extends BaseView<FavoriteAnimeViewModel> {
  const FavoriteAnimePage({super.key, required super.vmFactory});

  @override
  Widget build(FavoriteAnimeViewModel vm) {

    final isNotHorizontal = MediaQuery.of(vm.context).orientation != Orientation.landscape;
    return Scaffold(
        appBar: isNotHorizontal ? CustomAppBar(titleAppBar: S.of(vm.context).title_favorite , context: vm.context,): null,
        body: Container());
  }
}
