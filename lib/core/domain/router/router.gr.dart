// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anime_hub/core/domain/model/anime_api_item.dart' as _i13;
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
import 'package:anime_hub/feature/auto_tabs_router/presentation/main_screen.dart'
    as _i7;
import 'package:anime_hub/feature/chat/domain/repository/chat_and_auth_repository.dart'
    as _i15;
import 'package:anime_hub/feature/chat/presetation/chat/chat_page.dart' as _i5;
import 'package:anime_hub/feature/chat/presetation/personal_chat/personal_chat_page.dart'
    as _i8;
import 'package:anime_hub/feature/chat/presetation/registration/registration_page.dart'
    as _i10;
import 'package:anime_hub/feature/player/presentation/payer_page.dart' as _i9;
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/cupertino.dart' as _i12;
import 'package:flutter/material.dart' as _i14;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AnimeFavoritesSearch.name: (routeData) {
      final args = routeData.argsAs<AnimeFavoritesSearchArgs>(
          orElse: () => const AnimeFavoritesSearchArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AnimeFavoritesSearch(key: args.key),
      );
    },
    AnimeInfoRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeInfoRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AnimeInfoPage(
          key: args.key,
          animeItem: args.animeItem,
        ),
      );
    },
    AnimeReleasesRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeReleasesRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
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
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AnimeSearch(key: args.key),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ChatPage(
          key: args.key,
          chatAndAuthRepository: args.chatAndAuthRepository,
        ),
      );
    },
    FavoriteAnimeRoute.name: (routeData) {
      final args = routeData.argsAs<FavoriteAnimeRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.FavoriteAnimePage(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MainScreen(),
      );
    },
    PersonalChatRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalChatRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.PersonalChatPage(
          key: args.key,
          receiverUsername: args.receiverUsername,
          chatAndAuthRepository: args.chatAndAuthRepository,
          receiverId: args.receiverId,
        ),
      );
    },
    PlayerRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.PlayerPage(
          key: args.key,
          animeStreamUrl: args.animeStreamUrl,
        ),
      );
    },
    RegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.RegistrationPage(
          key: args.key,
          chatAndAuthRepository: args.chatAndAuthRepository,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AnimeFavoritesSearch]
class AnimeFavoritesSearch
    extends _i11.PageRouteInfo<AnimeFavoritesSearchArgs> {
  AnimeFavoritesSearch({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          AnimeFavoritesSearch.name,
          args: AnimeFavoritesSearchArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AnimeFavoritesSearch';

  static const _i11.PageInfo<AnimeFavoritesSearchArgs> page =
      _i11.PageInfo<AnimeFavoritesSearchArgs>(name);
}

class AnimeFavoritesSearchArgs {
  const AnimeFavoritesSearchArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'AnimeFavoritesSearchArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AnimeInfoPage]
class AnimeInfoRoute extends _i11.PageRouteInfo<AnimeInfoRouteArgs> {
  AnimeInfoRoute({
    _i12.Key? key,
    required _i13.AnimeApiItem animeItem,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          AnimeInfoRoute.name,
          args: AnimeInfoRouteArgs(
            key: key,
            animeItem: animeItem,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeInfoRoute';

  static const _i11.PageInfo<AnimeInfoRouteArgs> page =
      _i11.PageInfo<AnimeInfoRouteArgs>(name);
}

class AnimeInfoRouteArgs {
  const AnimeInfoRouteArgs({
    this.key,
    required this.animeItem,
  });

  final _i12.Key? key;

  final _i13.AnimeApiItem animeItem;

  @override
  String toString() {
    return 'AnimeInfoRouteArgs{key: $key, animeItem: $animeItem}';
  }
}

/// generated route for
/// [_i3.AnimeReleasesPage]
class AnimeReleasesRoute extends _i11.PageRouteInfo<AnimeReleasesRouteArgs> {
  AnimeReleasesRoute({
    _i14.Key? key,
    required _i14.ScrollController controller,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          AnimeReleasesRoute.name,
          args: AnimeReleasesRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeReleasesRoute';

  static const _i11.PageInfo<AnimeReleasesRouteArgs> page =
      _i11.PageInfo<AnimeReleasesRouteArgs>(name);
}

class AnimeReleasesRouteArgs {
  const AnimeReleasesRouteArgs({
    this.key,
    required this.controller,
  });

  final _i14.Key? key;

  final _i14.ScrollController controller;

  @override
  String toString() {
    return 'AnimeReleasesRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i4.AnimeSearch]
class AnimeSearch extends _i11.PageRouteInfo<AnimeSearchArgs> {
  AnimeSearch({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          AnimeSearch.name,
          args: AnimeSearchArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AnimeSearch';

  static const _i11.PageInfo<AnimeSearchArgs> page =
      _i11.PageInfo<AnimeSearchArgs>(name);
}

class AnimeSearchArgs {
  const AnimeSearchArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'AnimeSearchArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ChatPage]
class ChatRoute extends _i11.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i12.Key? key,
    required _i15.ChatAndAuthRepository chatAndAuthRepository,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            key: key,
            chatAndAuthRepository: chatAndAuthRepository,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i11.PageInfo<ChatRouteArgs> page =
      _i11.PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.chatAndAuthRepository,
  });

  final _i12.Key? key;

  final _i15.ChatAndAuthRepository chatAndAuthRepository;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, chatAndAuthRepository: $chatAndAuthRepository}';
  }
}

/// generated route for
/// [_i6.FavoriteAnimePage]
class FavoriteAnimeRoute extends _i11.PageRouteInfo<FavoriteAnimeRouteArgs> {
  FavoriteAnimeRoute({
    _i14.Key? key,
    required _i14.ScrollController controller,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          FavoriteAnimeRoute.name,
          args: FavoriteAnimeRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'FavoriteAnimeRoute';

  static const _i11.PageInfo<FavoriteAnimeRouteArgs> page =
      _i11.PageInfo<FavoriteAnimeRouteArgs>(name);
}

class FavoriteAnimeRouteArgs {
  const FavoriteAnimeRouteArgs({
    this.key,
    required this.controller,
  });

  final _i14.Key? key;

  final _i14.ScrollController controller;

  @override
  String toString() {
    return 'FavoriteAnimeRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i7.MainScreen]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PersonalChatPage]
class PersonalChatRoute extends _i11.PageRouteInfo<PersonalChatRouteArgs> {
  PersonalChatRoute({
    _i12.Key? key,
    required String receiverUsername,
    required _i15.ChatAndAuthRepository chatAndAuthRepository,
    required String receiverId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          PersonalChatRoute.name,
          args: PersonalChatRouteArgs(
            key: key,
            receiverUsername: receiverUsername,
            chatAndAuthRepository: chatAndAuthRepository,
            receiverId: receiverId,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonalChatRoute';

  static const _i11.PageInfo<PersonalChatRouteArgs> page =
      _i11.PageInfo<PersonalChatRouteArgs>(name);
}

class PersonalChatRouteArgs {
  const PersonalChatRouteArgs({
    this.key,
    required this.receiverUsername,
    required this.chatAndAuthRepository,
    required this.receiverId,
  });

  final _i12.Key? key;

  final String receiverUsername;

  final _i15.ChatAndAuthRepository chatAndAuthRepository;

  final String receiverId;

  @override
  String toString() {
    return 'PersonalChatRouteArgs{key: $key, receiverUsername: $receiverUsername, chatAndAuthRepository: $chatAndAuthRepository, receiverId: $receiverId}';
  }
}

/// generated route for
/// [_i9.PlayerPage]
class PlayerRoute extends _i11.PageRouteInfo<PlayerRouteArgs> {
  PlayerRoute({
    _i12.Key? key,
    required String animeStreamUrl,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          PlayerRoute.name,
          args: PlayerRouteArgs(
            key: key,
            animeStreamUrl: animeStreamUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

  static const _i11.PageInfo<PlayerRouteArgs> page =
      _i11.PageInfo<PlayerRouteArgs>(name);
}

class PlayerRouteArgs {
  const PlayerRouteArgs({
    this.key,
    required this.animeStreamUrl,
  });

  final _i12.Key? key;

  final String animeStreamUrl;

  @override
  String toString() {
    return 'PlayerRouteArgs{key: $key, animeStreamUrl: $animeStreamUrl}';
  }
}

/// generated route for
/// [_i10.RegistrationPage]
class RegistrationRoute extends _i11.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({
    _i14.Key? key,
    required _i15.ChatAndAuthRepository chatAndAuthRepository,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RegistrationRoute.name,
          args: RegistrationRouteArgs(
            key: key,
            chatAndAuthRepository: chatAndAuthRepository,
          ),
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const _i11.PageInfo<RegistrationRouteArgs> page =
      _i11.PageInfo<RegistrationRouteArgs>(name);
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({
    this.key,
    required this.chatAndAuthRepository,
  });

  final _i14.Key? key;

  final _i15.ChatAndAuthRepository chatAndAuthRepository;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key, chatAndAuthRepository: $chatAndAuthRepository}';
  }
}
