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
    as _i2;
import 'package:auto_route/auto_route.dart' as _i3;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AnimeNewReleasesRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AnimeNewReleasesPage(),
      );
    },
    FavoriteAnimeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavoriteAnimePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AnimeNewReleasesPage]
class AnimeNewReleasesRoute extends _i3.PageRouteInfo<void> {
  const AnimeNewReleasesRoute({List<_i3.PageRouteInfo>? children})
      : super(
          AnimeNewReleasesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnimeNewReleasesRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FavoriteAnimePage]
class FavoriteAnimeRoute extends _i3.PageRouteInfo<void> {
  const FavoriteAnimeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          FavoriteAnimeRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteAnimeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
