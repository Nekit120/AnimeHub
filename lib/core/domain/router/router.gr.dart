// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anime_hub/feature/anime_board/presetation/anime_releses_page/anime_releases_page.dart'
    as _i2;
import 'package:anime_hub/feature/anime_board/presetation/anime_releses_page/anime_releases_vm.dart'
    as _i12;
import 'package:anime_hub/feature/anime_board/presetation/anime_search/anime_search_page.dart'
    as _i3;
import 'package:anime_hub/feature/anime_board/presetation/anime_search/anime_search_vm.dart'
    as _i13;
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_page.dart'
    as _i5;
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_vm.dart'
    as _i15;
import 'package:anime_hub/feature/anime_info/presetration/anime_info_page.dart'
    as _i1;
import 'package:anime_hub/feature/anime_info/presetration/anime_info_vm.dart'
    as _i10;
import 'package:anime_hub/feature/auth/presetation/auth_page.dart' as _i4;
import 'package:anime_hub/feature/auth/presetation/auth_vm.dart' as _i14;
import 'package:anime_hub/feature/auto_tabs_router/presentation/main_screen.dart'
    as _i6;
import 'package:anime_hub/feature/player/presentation/payer_page.dart' as _i7;
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/cupertino.dart' as _i9;
import 'package:flutter/material.dart' as _i11;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AnimeInfoRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeInfoRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AnimeInfoPage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    AnimeReleasesRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeReleasesRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AnimeReleasesPage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    AnimeSearch.name: (routeData) {
      final args = routeData.argsAs<AnimeSearchArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AnimeSearch(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      final args = routeData.argsAs<AuthRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AuthPage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    FavoriteAnimeRoute.name: (routeData) {
      final args = routeData.argsAs<FavoriteAnimeRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.FavoriteAnimePage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MainScreen(),
      );
    },
    PlayerRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.PlayerPage(
          key: args.key,
          animeStreamUrl: args.animeStreamUrl,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AnimeInfoPage]
class AnimeInfoRoute extends _i8.PageRouteInfo<AnimeInfoRouteArgs> {
  AnimeInfoRoute({
    _i9.Key? key,
    required _i10.AnimeInfoViewModel Function(_i9.BuildContext) vmFactory,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          AnimeInfoRoute.name,
          args: AnimeInfoRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeInfoRoute';

  static const _i8.PageInfo<AnimeInfoRouteArgs> page =
      _i8.PageInfo<AnimeInfoRouteArgs>(name);
}

class AnimeInfoRouteArgs {
  const AnimeInfoRouteArgs({
    this.key,
    required this.vmFactory,
  });

  final _i9.Key? key;

  final _i10.AnimeInfoViewModel Function(_i9.BuildContext) vmFactory;

  @override
  String toString() {
    return 'AnimeInfoRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i2.AnimeReleasesPage]
class AnimeReleasesRoute extends _i8.PageRouteInfo<AnimeReleasesRouteArgs> {
  AnimeReleasesRoute({
    _i11.Key? key,
    required _i12.AnimeReleasesViewModel Function(_i11.BuildContext) vmFactory,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          AnimeReleasesRoute.name,
          args: AnimeReleasesRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeReleasesRoute';

  static const _i8.PageInfo<AnimeReleasesRouteArgs> page =
      _i8.PageInfo<AnimeReleasesRouteArgs>(name);
}

class AnimeReleasesRouteArgs {
  const AnimeReleasesRouteArgs({
    this.key,
    required this.vmFactory,
  });

  final _i11.Key? key;

  final _i12.AnimeReleasesViewModel Function(_i11.BuildContext) vmFactory;

  @override
  String toString() {
    return 'AnimeReleasesRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i3.AnimeSearch]
class AnimeSearch extends _i8.PageRouteInfo<AnimeSearchArgs> {
  AnimeSearch({
    _i9.Key? key,
    required _i13.AnimeSearchViewModel Function(_i9.BuildContext) vmFactory,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          AnimeSearch.name,
          args: AnimeSearchArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeSearch';

  static const _i8.PageInfo<AnimeSearchArgs> page =
      _i8.PageInfo<AnimeSearchArgs>(name);
}

class AnimeSearchArgs {
  const AnimeSearchArgs({
    this.key,
    required this.vmFactory,
  });

  final _i9.Key? key;

  final _i13.AnimeSearchViewModel Function(_i9.BuildContext) vmFactory;

  @override
  String toString() {
    return 'AnimeSearchArgs{key: $key, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i4.AuthPage]
class AuthRoute extends _i8.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i9.Key? key,
    required _i14.AuthViewModel Function(_i9.BuildContext) vmFactory,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i8.PageInfo<AuthRouteArgs> page =
      _i8.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    required this.vmFactory,
  });

  final _i9.Key? key;

  final _i14.AuthViewModel Function(_i9.BuildContext) vmFactory;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i5.FavoriteAnimePage]
class FavoriteAnimeRoute extends _i8.PageRouteInfo<FavoriteAnimeRouteArgs> {
  FavoriteAnimeRoute({
    _i11.Key? key,
    required _i15.FavoriteAnimeViewModel Function(_i11.BuildContext) vmFactory,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          FavoriteAnimeRoute.name,
          args: FavoriteAnimeRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'FavoriteAnimeRoute';

  static const _i8.PageInfo<FavoriteAnimeRouteArgs> page =
      _i8.PageInfo<FavoriteAnimeRouteArgs>(name);
}

class FavoriteAnimeRouteArgs {
  const FavoriteAnimeRouteArgs({
    this.key,
    required this.vmFactory,
  });

  final _i11.Key? key;

  final _i15.FavoriteAnimeViewModel Function(_i11.BuildContext) vmFactory;

  @override
  String toString() {
    return 'FavoriteAnimeRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i6.MainScreen]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PlayerPage]
class PlayerRoute extends _i8.PageRouteInfo<PlayerRouteArgs> {
  PlayerRoute({
    _i9.Key? key,
    required String animeStreamUrl,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          PlayerRoute.name,
          args: PlayerRouteArgs(
            key: key,
            animeStreamUrl: animeStreamUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

  static const _i8.PageInfo<PlayerRouteArgs> page =
      _i8.PageInfo<PlayerRouteArgs>(name);
}

class PlayerRouteArgs {
  const PlayerRouteArgs({
    this.key,
    required this.animeStreamUrl,
  });

  final _i9.Key? key;

  final String animeStreamUrl;

  @override
  String toString() {
    return 'PlayerRouteArgs{key: $key, animeStreamUrl: $animeStreamUrl}';
  }
}
