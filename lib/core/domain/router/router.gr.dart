// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anime_hub/feature/anime_board/presetation/anime_new_item_page/anime_new_releases_page.dart'
    as _i1;
import 'package:anime_hub/feature/anime_board/presetation/anime_new_item_page/anime_releases_vm.dart'
    as _i7;
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_page.dart'
    as _i3;
import 'package:anime_hub/feature/anime_board/presetation/favorite_anime_page/favorite_anime_vm.dart'
    as _i9;
import 'package:anime_hub/feature/auth/presetation/auth_page.dart' as _i2;
import 'package:anime_hub/feature/auth/presetation/auth_vm.dart' as _i8;
import 'package:anime_hub/feature/auto_tabs_router/presentation/main_screen.dart'
    as _i4;
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AnimeNewReleasesRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeNewReleasesRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AnimeNewReleasesPage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      final args = routeData.argsAs<AuthRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AuthPage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
      );
    },
    FavoriteAnimeRoute.name: (routeData) {
      final args = routeData.argsAs<FavoriteAnimeRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.FavoriteAnimePage(
          key: args.key,
          vmFactory: args.vmFactory,
        ),
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
class AnimeNewReleasesRoute
    extends _i5.PageRouteInfo<AnimeNewReleasesRouteArgs> {
  AnimeNewReleasesRoute({
    _i6.Key? key,
    required _i7.AnimeReleasesViewModel Function(_i6.BuildContext) vmFactory,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AnimeNewReleasesRoute.name,
          args: AnimeNewReleasesRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeNewReleasesRoute';

  static const _i5.PageInfo<AnimeNewReleasesRouteArgs> page =
      _i5.PageInfo<AnimeNewReleasesRouteArgs>(name);
}

class AnimeNewReleasesRouteArgs {
  const AnimeNewReleasesRouteArgs({
    this.key,
    required this.vmFactory,
  });

  final _i6.Key? key;

  final _i7.AnimeReleasesViewModel Function(_i6.BuildContext) vmFactory;

  @override
  String toString() {
    return 'AnimeNewReleasesRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i5.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i6.Key? key,
    required _i8.AuthViewModel Function(_i6.BuildContext) vmFactory,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i5.PageInfo<AuthRouteArgs> page =
      _i5.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    required this.vmFactory,
  });

  final _i6.Key? key;

  final _i8.AuthViewModel Function(_i6.BuildContext) vmFactory;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
}

/// generated route for
/// [_i3.FavoriteAnimePage]
class FavoriteAnimeRoute extends _i5.PageRouteInfo<FavoriteAnimeRouteArgs> {
  FavoriteAnimeRoute({
    _i6.Key? key,
    required _i9.FavoriteAnimeViewModel Function(_i6.BuildContext) vmFactory,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          FavoriteAnimeRoute.name,
          args: FavoriteAnimeRouteArgs(
            key: key,
            vmFactory: vmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'FavoriteAnimeRoute';

  static const _i5.PageInfo<FavoriteAnimeRouteArgs> page =
      _i5.PageInfo<FavoriteAnimeRouteArgs>(name);
}

class FavoriteAnimeRouteArgs {
  const FavoriteAnimeRouteArgs({
    this.key,
    required this.vmFactory,
  });

  final _i6.Key? key;

  final _i9.FavoriteAnimeViewModel Function(_i6.BuildContext) vmFactory;

  @override
  String toString() {
    return 'FavoriteAnimeRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
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
