// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anime_hub/feature/anime_board/domain/model/anime_api_item.dart'
    as _i8;
import 'package:anime_hub/feature/anime_board/presetation/anime_new_item_page/anime_new_releases_page.dart'
    as _i2;
import 'package:anime_hub/feature/anime_board/presetation/anime_new_item_page/anime_releases_vm.dart'
    as _i9;
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_page.dart'
    as _i4;
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_vm.dart'
    as _i11;
import 'package:anime_hub/feature/anime_info/presetration/anime_info_page.dart'
    as _i1;
import 'package:anime_hub/feature/auth/presetation/auth_page.dart' as _i3;
import 'package:anime_hub/feature/auth/presetation/auth_vm.dart' as _i10;
import 'package:anime_hub/feature/auto_tabs_router/presentation/main_screen.dart'
    as _i5;
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/cupertino.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AnimeInfoRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeInfoRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AnimeInfoPage(
          key: args.key,
          animeItem: args.animeItem,
        ),
      );
    },
    AnimeNewReleasesRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeNewReleasesRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AnimeNewReleasesPage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      final args = routeData.argsAs<AuthRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AuthPage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    FavoriteAnimeRoute.name: (routeData) {
      final args = routeData.argsAs<FavoriteAnimeRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.FavoriteAnimePage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MainScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AnimeInfoPage]
class AnimeInfoRoute extends _i6.PageRouteInfo<AnimeInfoRouteArgs> {
  AnimeInfoRoute({
    _i7.Key? key,
    required _i8.AnimeApiItem animeItem,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AnimeInfoRoute.name,
          args: AnimeInfoRouteArgs(
            key: key,
            animeItem: animeItem,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeInfoRoute';

  static const _i6.PageInfo<AnimeInfoRouteArgs> page =
      _i6.PageInfo<AnimeInfoRouteArgs>(name);
}

class AnimeInfoRouteArgs {
  const AnimeInfoRouteArgs({
    this.key,
    required this.animeItem,
  });

  final _i7.Key? key;

  final _i8.AnimeApiItem animeItem;

  @override
  String toString() {
    return 'AnimeInfoRouteArgs{key: $key, animeItem: $animeItem}';
  }
}

/// generated route for
/// [_i2.AnimeNewReleasesPage]
class AnimeNewReleasesRoute
    extends _i6.PageRouteInfo<AnimeNewReleasesRouteArgs> {
  AnimeNewReleasesRoute({
    _i7.Key? key,
    required _i9.AnimeReleasesViewModel Function(_i7.BuildContext) vmFactory,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AnimeNewReleasesRoute.name,
          args: AnimeNewReleasesRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeNewReleasesRoute';

  static const _i6.PageInfo<AnimeNewReleasesRouteArgs> page =
      _i6.PageInfo<AnimeNewReleasesRouteArgs>(name);
}

class AnimeNewReleasesRouteArgs {
  const AnimeNewReleasesRouteArgs({
    this.key,
    required this.vmFactory,
  });

  final _i7.Key? key;

  final _i9.AnimeReleasesViewModel Function(_i7.BuildContext) vmFactory;

  @override
  String toString() {
    return 'AnimeNewReleasesRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i3.AuthPage]
class AuthRoute extends _i6.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i7.Key? key,
    required _i10.AuthViewModel Function(_i7.BuildContext) vmFactory,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i6.PageInfo<AuthRouteArgs> page =
      _i6.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    required this.vmFactory,
  });

  final _i7.Key? key;

  final _i10.AuthViewModel Function(_i7.BuildContext) vmFactory;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i4.FavoriteAnimePage]
class FavoriteAnimeRoute extends _i6.PageRouteInfo<FavoriteAnimeRouteArgs> {
  FavoriteAnimeRoute({
    _i7.Key? key,
    required _i11.FavoriteAnimeViewModel Function(_i7.BuildContext) vmFactory,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          FavoriteAnimeRoute.name,
          args: FavoriteAnimeRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'FavoriteAnimeRoute';

  static const _i6.PageInfo<FavoriteAnimeRouteArgs> page =
      _i6.PageInfo<FavoriteAnimeRouteArgs>(name);
}

class FavoriteAnimeRouteArgs {
  const FavoriteAnimeRouteArgs({
    this.key,
    required this.vmFactory,
  });

  final _i7.Key? key;

  final _i11.FavoriteAnimeViewModel Function(_i7.BuildContext) vmFactory;

  @override
  String toString() {
    return 'FavoriteAnimeRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i5.MainScreen]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
