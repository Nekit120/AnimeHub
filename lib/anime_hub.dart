import 'package:anime_hub/theme/theme.dart';
import 'package:flutter/material.dart';
import 'core/domain/container/app_container.dart';
import 'core/domain/router/router.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


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
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: lightTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
