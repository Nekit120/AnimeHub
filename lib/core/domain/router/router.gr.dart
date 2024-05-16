// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anime_hub/core/domain/model/anime_api_item.dart' as _i11;
import 'package:anime_hub/feature/anime/presetation/anime_favorites_search/anime_favorites_search_page.dart'
    as _i1;
import 'package:anime_hub/feature/anime/presetation/anime_info_page/anime_info_page.dart'
    as _i2;
import 'package:anime_hub/feature/anime/presetation/anime_releses_page/anime_releases_page.dart'
    as _i3;
import 'package:anime_hub/feature/anime/presetation/anime_search/anime_search_page.dart'
    as _i4;
import 'package:anime_hub/feature/anime/presetation/favorite_anime_page/favorite_anime_page.dart'
    as _i6;
import 'package:anime_hub/feature/auth/presetation/auth_page.dart' as _i5;
import 'package:anime_hub/feature/auto_tabs_router/presentation/main_screen.dart'
    as _i7;
import 'package:anime_hub/feature/player/presentation/payer_page.dart' as _i8;
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/cupertino.dart' as _i10;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AnimeFavoritesSearch.name: (routeData) {
      final args = routeData.argsAs<AnimeFavoritesSearchArgs>(
          orElse: () => const AnimeFavoritesSearchArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AnimeFavoritesSearch(key: args.key),
      );
    },
    AnimeInfoRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeInfoRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AnimeInfoPage(
          key: args.key,
          animeItem: args.animeItem,
        ),
      );
    },
    AnimeReleasesRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeReleasesRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AnimeReleasesPage(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    AnimeSearch.name: (routeData) {
      final args = routeData.argsAs<AnimeSearchArgs>(
          orElse: () => const AnimeSearchArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AnimeSearch(key: args.key),
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.AuthPage(key: args.key),
      );
    },
    FavoriteAnimeRoute.name: (routeData) {
      final args = routeData.argsAs<FavoriteAnimeRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.FavoriteAnimePage(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MainScreen(),
      );
    },
    PlayerRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.PlayerPage(
          key: args.key,
          animeStreamUrl: args.animeStreamUrl,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AnimeFavoritesSearch]
class AnimeFavoritesSearch extends _i9.PageRouteInfo<AnimeFavoritesSearchArgs> {
  AnimeFavoritesSearch({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          AnimeFavoritesSearch.name,
          args: AnimeFavoritesSearchArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AnimeFavoritesSearch';

  static const _i9.PageInfo<AnimeFavoritesSearchArgs> page =
      _i9.PageInfo<AnimeFavoritesSearchArgs>(name);
}

class AnimeFavoritesSearchArgs {
  const AnimeFavoritesSearchArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'AnimeFavoritesSearchArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AnimeInfoPage]
class AnimeInfoRoute extends _i9.PageRouteInfo<AnimeInfoRouteArgs> {
  AnimeInfoRoute({
    _i10.Key? key,
    required _i11.AnimeApiItem animeItem,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          AnimeInfoRoute.name,
          args: AnimeInfoRouteArgs(
            key: key,
            animeItem: animeItem,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeInfoRoute';

  static const _i9.PageInfo<AnimeInfoRouteArgs> page =
      _i9.PageInfo<AnimeInfoRouteArgs>(name);
}

class AnimeInfoRouteArgs {
  const AnimeInfoRouteArgs({
    this.key,
    required this.animeItem,
  });

  final _i10.Key? key;

  final _i11.AnimeApiItem animeItem;

  @override
  String toString() {
    return 'AnimeInfoRouteArgs{key: $key, animeItem: $animeItem}';
  }
}

/// generated route for
/// [_i3.AnimeReleasesPage]
class AnimeReleasesRoute extends _i9.PageRouteInfo<AnimeReleasesRouteArgs> {
  AnimeReleasesRoute({
    _i12.Key? key,
    required _i12.ScrollController controller,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          AnimeReleasesRoute.name,
          args: AnimeReleasesRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeReleasesRoute';

  static const _i9.PageInfo<AnimeReleasesRouteArgs> page =
      _i9.PageInfo<AnimeReleasesRouteArgs>(name);
}

class AnimeReleasesRouteArgs {
  const AnimeReleasesRouteArgs({
    this.key,
    required this.controller,
  });

  final _i12.Key? key;

  final _i12.ScrollController controller;

  @override
  String toString() {
    return 'AnimeReleasesRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i4.AnimeSearch]
class AnimeSearch extends _i9.PageRouteInfo<AnimeSearchArgs> {
  AnimeSearch({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          AnimeSearch.name,
          args: AnimeSearchArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AnimeSearch';

  static const _i9.PageInfo<AnimeSearchArgs> page =
      _i9.PageInfo<AnimeSearchArgs>(name);
}

class AnimeSearchArgs {
  const AnimeSearchArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'AnimeSearchArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.AuthPage]
class AuthRoute extends _i9.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i9.PageInfo<AuthRouteArgs> page =
      _i9.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.FavoriteAnimePage]
class FavoriteAnimeRoute extends _i9.PageRouteInfo<FavoriteAnimeRouteArgs> {
  FavoriteAnimeRoute({
    _i12.Key? key,
    required _i12.ScrollController controller,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          FavoriteAnimeRoute.name,
          args: FavoriteAnimeRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'FavoriteAnimeRoute';

  static const _i9.PageInfo<FavoriteAnimeRouteArgs> page =
      _i9.PageInfo<FavoriteAnimeRouteArgs>(name);
}

class FavoriteAnimeRouteArgs {
  const FavoriteAnimeRouteArgs({
    this.key,
    required this.controller,
  });

  final _i12.Key? key;

  final _i12.ScrollController controller;

  @override
  String toString() {
    return 'FavoriteAnimeRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i7.MainScreen]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PlayerPage]
class PlayerRoute extends _i9.PageRouteInfo<PlayerRouteArgs> {
  PlayerRoute({
    _i10.Key? key,
    required String animeStreamUrl,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          PlayerRoute.name,
          args: PlayerRouteArgs(
            key: key,
            animeStreamUrl: animeStreamUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

  static const _i9.PageInfo<PlayerRouteArgs> page =
      _i9.PageInfo<PlayerRouteArgs>(name);
}

class PlayerRouteArgs {
  const PlayerRouteArgs({
    this.key,
    required this.animeStreamUrl,
  });

  final _i10.Key? key;

  final String animeStreamUrl;

  @override
  String toString() {
    return 'PlayerRouteArgs{key: $key, animeStreamUrl: $animeStreamUrl}';
  }
}
