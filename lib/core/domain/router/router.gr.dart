// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anime_hub/feature/anime_board/domain/model/anime_api_item.dart'
    as _i9;
import 'package:anime_hub/feature/anime_board/presetation/anime_releses_page/anime_releases_page.dart'
    as _i2;
import 'package:anime_hub/feature/anime_board/presetation/anime_releses_page/anime_releases_vm.dart'
    as _i12;
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_page.dart'
    as _i4;
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_vm.dart'
    as _i14;
import 'package:anime_hub/feature/anime_info/presetration/anime_info_page.dart'
    as _i1;
import 'package:anime_hub/feature/anime_info/presetration/anime_info_vm.dart'
    as _i10;
import 'package:anime_hub/feature/auth/presetation/auth_page.dart' as _i3;
import 'package:anime_hub/feature/auth/presetation/auth_vm.dart' as _i13;
import 'package:anime_hub/feature/auto_tabs_router/presentation/main_screen.dart'
    as _i5;
import 'package:anime_hub/feature/player/presentation/payer_page.dart' as _i6;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i8;
import 'package:flutter/material.dart' as _i11;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AnimeInfoRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeInfoRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AnimeInfoPage(
          key: args.key,
          animeItem: args.animeItem,
          vmFactory: args.vmFactory,
        ),
      );
    },
    AnimeReleasesRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeReleasesRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AnimeReleasesPage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      final args = routeData.argsAs<AuthRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AuthPage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    FavoriteAnimeRoute.name: (routeData) {
      final args = routeData.argsAs<FavoriteAnimeRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.FavoriteAnimePage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MainScreen(),
      );
    },
    PlayerRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.PlayerPage(
          key: args.key,
          animeStreamUrl: args.animeStreamUrl,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AnimeInfoPage]
class AnimeInfoRoute extends _i7.PageRouteInfo<AnimeInfoRouteArgs> {
  AnimeInfoRoute({
    _i8.Key? key,
    required _i9.AnimeApiItem animeItem,
    required _i10.AnimeInfoViewModel Function(_i8.BuildContext) vmFactory,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AnimeInfoRoute.name,
          args: AnimeInfoRouteArgs(
            key: key,
            animeItem: animeItem,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeInfoRoute';

  static const _i7.PageInfo<AnimeInfoRouteArgs> page =
      _i7.PageInfo<AnimeInfoRouteArgs>(name);
}

class AnimeInfoRouteArgs {
  const AnimeInfoRouteArgs({
    this.key,
    required this.animeItem,
    required this.vmFactory,
  });

  final _i8.Key? key;

  final _i9.AnimeApiItem animeItem;

  final _i10.AnimeInfoViewModel Function(_i8.BuildContext) vmFactory;

  @override
  String toString() {
    return 'AnimeInfoRouteArgs{key: $key, animeItem: $animeItem, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i2.AnimeReleasesPage]
class AnimeReleasesRoute extends _i7.PageRouteInfo<AnimeReleasesRouteArgs> {
  AnimeReleasesRoute({
    _i11.Key? key,
    required _i12.AnimeReleasesViewModel Function(_i11.BuildContext) vmFactory,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AnimeReleasesRoute.name,
          args: AnimeReleasesRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeReleasesRoute';

  static const _i7.PageInfo<AnimeReleasesRouteArgs> page =
      _i7.PageInfo<AnimeReleasesRouteArgs>(name);
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
/// [_i3.AuthPage]
class AuthRoute extends _i7.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i8.Key? key,
    required _i13.AuthViewModel Function(_i8.BuildContext) vmFactory,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i7.PageInfo<AuthRouteArgs> page =
      _i7.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    required this.vmFactory,
  });

  final _i8.Key? key;

  final _i13.AuthViewModel Function(_i8.BuildContext) vmFactory;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i4.FavoriteAnimePage]
class FavoriteAnimeRoute extends _i7.PageRouteInfo<FavoriteAnimeRouteArgs> {
  FavoriteAnimeRoute({
    _i11.Key? key,
    required _i14.FavoriteAnimeViewModel Function(_i11.BuildContext) vmFactory,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          FavoriteAnimeRoute.name,
          args: FavoriteAnimeRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'FavoriteAnimeRoute';

  static const _i7.PageInfo<FavoriteAnimeRouteArgs> page =
      _i7.PageInfo<FavoriteAnimeRouteArgs>(name);
}

class FavoriteAnimeRouteArgs {
  const FavoriteAnimeRouteArgs({
    this.key,
    required this.vmFactory,
  });

  final _i11.Key? key;

  final _i14.FavoriteAnimeViewModel Function(_i11.BuildContext) vmFactory;

  @override
  String toString() {
    return 'FavoriteAnimeRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i5.MainScreen]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PlayerPage]
class PlayerRoute extends _i7.PageRouteInfo<PlayerRouteArgs> {
  PlayerRoute({
    _i8.Key? key,
    required String animeStreamUrl,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          PlayerRoute.name,
          args: PlayerRouteArgs(
            key: key,
            animeStreamUrl: animeStreamUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

  static const _i7.PageInfo<PlayerRouteArgs> page =
      _i7.PageInfo<PlayerRouteArgs>(name);
}

class PlayerRouteArgs {
  const PlayerRouteArgs({
    this.key,
    required this.animeStreamUrl,
  });

  final _i8.Key? key;

  final String animeStreamUrl;

  @override
  String toString() {
    return 'PlayerRouteArgs{key: $key, animeStreamUrl: $animeStreamUrl}';
  }
}
