import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/router/router.gr.dart';
import '../../../../theme/theme_colors.dart';

@RoutePage()
class AnimeNewReleasesPage extends StatefulWidget {
  const AnimeNewReleasesPage({super.key});

  @override
  State<AnimeNewReleasesPage> createState() => _AnimeNewReleasesPageState();
}

class _AnimeNewReleasesPageState extends State<AnimeNewReleasesPage> {
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
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _profileAppBar,
      body: Container(
      ),
    );
  }
}
