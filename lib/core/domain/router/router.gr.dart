// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anime_hub/feature/anime_board/presetation/anime_new_item_page/anime_new_releases_page.dart'
    as _i1;
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_page.dart'
    as _i3;
import 'package:anime_hub/feature/auth/presetation/auth_page.dart' as _i2;
import 'package:anime_hub/feature/auto_tabs_router/presentation/main_screen.dart'
    as _i4;
import 'package:auto_route/auto_route.dart' as _i5;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AnimeNewReleasesRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AnimeNewReleasesPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
      );
    },
    FavoriteAnimeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FavoriteAnimePage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AnimeNewReleasesPage]
class AnimeNewReleasesRoute extends _i5.PageRouteInfo<void> {
  const AnimeNewReleasesRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AnimeNewReleasesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnimeNewReleasesRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i5.PageRouteInfo<void> {
  const AuthRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FavoriteAnimePage]
class FavoriteAnimeRoute extends _i5.PageRouteInfo<void> {
  const FavoriteAnimeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          FavoriteAnimeRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteAnimeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainScreen]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
