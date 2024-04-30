import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme/theme_colors.dart';

@RoutePage()
class FavoriteAnimePage extends StatefulWidget {
  const FavoriteAnimePage({super.key});

  @override
  State<FavoriteAnimePage> createState() => _AnimeNewItemPageState();
}
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
class _AnimeNewItemPageState extends State<FavoriteAnimePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:_profileAppBar ,
      body: Container(
      ),
    );
  }
}
