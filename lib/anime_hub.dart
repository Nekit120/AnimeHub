import 'package:anime_hub/theme/theme.dart';
import 'package:flutter/material.dart';
import 'core/domain/container/app_container.dart';
import 'core/domain/router/router.dart';

class AnimeHub extends StatefulWidget {
  final AppContainer appContainer;

  const AnimeHub({super.key, required this.appContainer});

  @override
  State<AnimeHub> createState() => _AnimeHubState();
}

class _AnimeHubState extends State<AnimeHub> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "AnimeHub",
      theme: lightTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
