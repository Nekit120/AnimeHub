// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i20;

import 'package:anime_hub/core/data/firebase_services/model/user_model.dart'
    as _i23;
import 'package:anime_hub/core/data/firebase_services/model/user_model_with_last_message.dart'
    as _i24;
import 'package:anime_hub/core/domain/model/anime_api_item.dart' as _i18;
import 'package:anime_hub/feature/anime/domain/repository/anime_repository.dart'
    as _i25;
import 'package:anime_hub/feature/anime/presetation/share_use/anime_send_invite_search/send_anime_search_page.dart'
    as _i13;
import 'package:anime_hub/feature/anime/presetation/single_use/anime_favorites_search/anime_favorites_search_page.dart'
    as _i1;
import 'package:anime_hub/feature/anime/presetation/single_use/anime_info_page/anime_info_page.dart'
    as _i2;
import 'package:anime_hub/feature/anime/presetation/single_use/anime_releses_page/anime_releases_page.dart'
    as _i3;
import 'package:anime_hub/feature/anime/presetation/single_use/anime_search/anime_search_page.dart'
    as _i4;
import 'package:anime_hub/feature/anime/presetation/single_use/favorite_anime_page/favorite_anime_page.dart'
    as _i7;
import 'package:anime_hub/feature/auto_tabs_router/presentation/main_screen.dart'
    as _i9;
import 'package:anime_hub/feature/chat/domain/repository/chat_and_auth_repository.dart'
    as _i21;
import 'package:anime_hub/feature/chat/presetation/chat/chat_page.dart' as _i5;
import 'package:anime_hub/feature/chat/presetation/personal_chat/personal_chat_page.dart'
    as _i10;
import 'package:anime_hub/feature/chat/presetation/registration/registration_page.dart'
    as _i12;
import 'package:anime_hub/feature/player/presentation/share_payer_page.dart'
    as _i14;
import 'package:anime_hub/feature/player/presentation/single_payer_page.dart'
    as _i15;
import 'package:anime_hub/feature/profile/domain/repository/profile_repository.dart'
    as _i22;
import 'package:anime_hub/feature/profile/presentation/editing_profile/editing_profile_page.dart'
    as _i6;
import 'package:anime_hub/feature/profile/presentation/interlocutor_profile/interlocutor_profile_page.dart'
    as _i8;
import 'package:anime_hub/feature/profile/presentation/profile/profile_page.dart'
    as _i11;
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/cupertino.dart' as _i17;
import 'package:flutter/material.dart' as _i19;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AnimeFavoritesSearch.name: (routeData) {
      final args = routeData.argsAs<AnimeFavoritesSearchArgs>(
          orElse: () => const AnimeFavoritesSearchArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AnimeFavoritesSearch(key: args.key),
      );
    },
    AnimeInfoRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeInfoRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AnimeInfoPage(
          key: args.key,
          animeItem: args.animeItem,
        ),
      );
    },
    AnimeReleasesRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeReleasesRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AnimeReleasesPage(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    AnimeSearch.name: (routeData) {
      final args = routeData.argsAs<AnimeSearchArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AnimeSearch(
          key: args.key,
          onTapCallback: args.onTapCallback,
        ),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ChatPage(
          key: args.key,
          chatAndAuthRepository: args.chatAndAuthRepository,
        ),
      );
    },
    EditingProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditingProfileRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.EditingProfilePage(
          key: args.key,
          profileRepository: args.profileRepository,
          userModel: args.userModel,
        ),
      );
    },
    FavoriteAnimeRoute.name: (routeData) {
      final args = routeData.argsAs<FavoriteAnimeRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.FavoriteAnimePage(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    InterlocutorProfileRoute.name: (routeData) {
      final args = routeData.argsAs<InterlocutorProfileRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.InterlocutorProfilePage(
          key: args.key,
          userModel: args.userModel,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.MainScreen(),
      );
    },
    PersonalChatRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalChatRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.PersonalChatPage(
          key: args.key,
          receiverUsername: args.receiverUsername,
          chatAndAuthRepository: args.chatAndAuthRepository,
          receiverId: args.receiverId,
          userModel: args.userModel,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ProfilePage(
          key: args.key,
          profileRepository: args.profileRepository,
        ),
      );
    },
    RegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.RegistrationPage(
          key: args.key,
          chatAndAuthRepository: args.chatAndAuthRepository,
        ),
      );
    },
    SendAnimeInviteRoute.name: (routeData) {
      final args = routeData.argsAs<SendAnimeInviteRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.SendAnimeInvitePage(
          key: args.key,
          animeRepository: args.animeRepository,
          chatAndAuthRepository: args.chatAndAuthRepository,
          acceptId: args.acceptId,
          proposedId: args.proposedId,
          receiverId: args.receiverId,
          userModel: args.userModel,
          receiverUsername: args.receiverUsername,
        ),
      );
    },
    SharePlayerRoute.name: (routeData) {
      final args = routeData.argsAs<SharePlayerRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.SharePlayerPage(
          key: args.key,
          animeStreamUrl: args.animeStreamUrl,
          receiverUsername: args.receiverUsername,
          receiverId: args.receiverId,
          userModel: args.userModel,
        ),
      );
    },
    SinglePlayerRoute.name: (routeData) {
      final args = routeData.argsAs<SinglePlayerRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.SinglePlayerPage(
          key: args.key,
          animeStreamUrl: args.animeStreamUrl,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AnimeFavoritesSearch]
class AnimeFavoritesSearch
    extends _i16.PageRouteInfo<AnimeFavoritesSearchArgs> {
  AnimeFavoritesSearch({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          AnimeFavoritesSearch.name,
          args: AnimeFavoritesSearchArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AnimeFavoritesSearch';

  static const _i16.PageInfo<AnimeFavoritesSearchArgs> page =
      _i16.PageInfo<AnimeFavoritesSearchArgs>(name);
}

class AnimeFavoritesSearchArgs {
  const AnimeFavoritesSearchArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'AnimeFavoritesSearchArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AnimeInfoPage]
class AnimeInfoRoute extends _i16.PageRouteInfo<AnimeInfoRouteArgs> {
  AnimeInfoRoute({
    _i17.Key? key,
    required _i18.AnimeApiItem animeItem,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          AnimeInfoRoute.name,
          args: AnimeInfoRouteArgs(
            key: key,
            animeItem: animeItem,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeInfoRoute';

  static const _i16.PageInfo<AnimeInfoRouteArgs> page =
      _i16.PageInfo<AnimeInfoRouteArgs>(name);
}

class AnimeInfoRouteArgs {
  const AnimeInfoRouteArgs({
    this.key,
    required this.animeItem,
  });

  final _i17.Key? key;

  final _i18.AnimeApiItem animeItem;

  @override
  String toString() {
    return 'AnimeInfoRouteArgs{key: $key, animeItem: $animeItem}';
  }
}

/// generated route for
/// [_i3.AnimeReleasesPage]
class AnimeReleasesRoute extends _i16.PageRouteInfo<AnimeReleasesRouteArgs> {
  AnimeReleasesRoute({
    _i19.Key? key,
    required _i19.ScrollController controller,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          AnimeReleasesRoute.name,
          args: AnimeReleasesRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeReleasesRoute';

  static const _i16.PageInfo<AnimeReleasesRouteArgs> page =
      _i16.PageInfo<AnimeReleasesRouteArgs>(name);
}

class AnimeReleasesRouteArgs {
  const AnimeReleasesRouteArgs({
    this.key,
    required this.controller,
  });

  final _i19.Key? key;

  final _i19.ScrollController controller;

  @override
  String toString() {
    return 'AnimeReleasesRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i4.AnimeSearch]
class AnimeSearch extends _i16.PageRouteInfo<AnimeSearchArgs> {
  AnimeSearch({
    _i17.Key? key,
    required _i20.Future<void> Function()? onTapCallback,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          AnimeSearch.name,
          args: AnimeSearchArgs(
            key: key,
            onTapCallback: onTapCallback,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeSearch';

  static const _i16.PageInfo<AnimeSearchArgs> page =
      _i16.PageInfo<AnimeSearchArgs>(name);
}

class AnimeSearchArgs {
  const AnimeSearchArgs({
    this.key,
    required this.onTapCallback,
  });

  final _i17.Key? key;

  final _i20.Future<void> Function()? onTapCallback;

  @override
  String toString() {
    return 'AnimeSearchArgs{key: $key, onTapCallback: $onTapCallback}';
  }
}

/// generated route for
/// [_i5.ChatPage]
class ChatRoute extends _i16.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i17.Key? key,
    required _i21.ChatAndAuthRepository chatAndAuthRepository,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            key: key,
            chatAndAuthRepository: chatAndAuthRepository,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i16.PageInfo<ChatRouteArgs> page =
      _i16.PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.chatAndAuthRepository,
  });

  final _i17.Key? key;

  final _i21.ChatAndAuthRepository chatAndAuthRepository;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, chatAndAuthRepository: $chatAndAuthRepository}';
  }
}

/// generated route for
/// [_i6.EditingProfilePage]
class EditingProfileRoute extends _i16.PageRouteInfo<EditingProfileRouteArgs> {
  EditingProfileRoute({
    _i19.Key? key,
    required _i22.ProfileRepository profileRepository,
    required _i23.UserModel userModel,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          EditingProfileRoute.name,
          args: EditingProfileRouteArgs(
            key: key,
            profileRepository: profileRepository,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'EditingProfileRoute';

  static const _i16.PageInfo<EditingProfileRouteArgs> page =
      _i16.PageInfo<EditingProfileRouteArgs>(name);
}

class EditingProfileRouteArgs {
  const EditingProfileRouteArgs({
    this.key,
    required this.profileRepository,
    required this.userModel,
  });

  final _i19.Key? key;

  final _i22.ProfileRepository profileRepository;

  final _i23.UserModel userModel;

  @override
  String toString() {
    return 'EditingProfileRouteArgs{key: $key, profileRepository: $profileRepository, userModel: $userModel}';
  }
}

/// generated route for
/// [_i7.FavoriteAnimePage]
class FavoriteAnimeRoute extends _i16.PageRouteInfo<FavoriteAnimeRouteArgs> {
  FavoriteAnimeRoute({
    _i19.Key? key,
    required _i19.ScrollController controller,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          FavoriteAnimeRoute.name,
          args: FavoriteAnimeRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'FavoriteAnimeRoute';

  static const _i16.PageInfo<FavoriteAnimeRouteArgs> page =
      _i16.PageInfo<FavoriteAnimeRouteArgs>(name);
}

class FavoriteAnimeRouteArgs {
  const FavoriteAnimeRouteArgs({
    this.key,
    required this.controller,
  });

  final _i19.Key? key;

  final _i19.ScrollController controller;

  @override
  String toString() {
    return 'FavoriteAnimeRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i8.InterlocutorProfilePage]
class InterlocutorProfileRoute
    extends _i16.PageRouteInfo<InterlocutorProfileRouteArgs> {
  InterlocutorProfileRoute({
    _i17.Key? key,
    required _i24.UserModelWithLastMessage userModel,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          InterlocutorProfileRoute.name,
          args: InterlocutorProfileRouteArgs(
            key: key,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'InterlocutorProfileRoute';

  static const _i16.PageInfo<InterlocutorProfileRouteArgs> page =
      _i16.PageInfo<InterlocutorProfileRouteArgs>(name);
}

class InterlocutorProfileRouteArgs {
  const InterlocutorProfileRouteArgs({
    this.key,
    required this.userModel,
  });

  final _i17.Key? key;

  final _i24.UserModelWithLastMessage userModel;

  @override
  String toString() {
    return 'InterlocutorProfileRouteArgs{key: $key, userModel: $userModel}';
  }
}

/// generated route for
/// [_i9.MainScreen]
class MainRoute extends _i16.PageRouteInfo<void> {
  const MainRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PersonalChatPage]
class PersonalChatRoute extends _i16.PageRouteInfo<PersonalChatRouteArgs> {
  PersonalChatRoute({
    _i17.Key? key,
    required String receiverUsername,
    required _i21.ChatAndAuthRepository chatAndAuthRepository,
    required String receiverId,
    required _i24.UserModelWithLastMessage userModel,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          PersonalChatRoute.name,
          args: PersonalChatRouteArgs(
            key: key,
            receiverUsername: receiverUsername,
            chatAndAuthRepository: chatAndAuthRepository,
            receiverId: receiverId,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonalChatRoute';

  static const _i16.PageInfo<PersonalChatRouteArgs> page =
      _i16.PageInfo<PersonalChatRouteArgs>(name);
}

class PersonalChatRouteArgs {
  const PersonalChatRouteArgs({
    this.key,
    required this.receiverUsername,
    required this.chatAndAuthRepository,
    required this.receiverId,
    required this.userModel,
  });

  final _i17.Key? key;

  final String receiverUsername;

  final _i21.ChatAndAuthRepository chatAndAuthRepository;

  final String receiverId;

  final _i24.UserModelWithLastMessage userModel;

  @override
  String toString() {
    return 'PersonalChatRouteArgs{key: $key, receiverUsername: $receiverUsername, chatAndAuthRepository: $chatAndAuthRepository, receiverId: $receiverId, userModel: $userModel}';
  }
}

/// generated route for
/// [_i11.ProfilePage]
class ProfileRoute extends _i16.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i17.Key? key,
    required _i22.ProfileRepository profileRepository,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            profileRepository: profileRepository,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i16.PageInfo<ProfileRouteArgs> page =
      _i16.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.profileRepository,
  });

  final _i17.Key? key;

  final _i22.ProfileRepository profileRepository;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, profileRepository: $profileRepository}';
  }
}

/// generated route for
/// [_i12.RegistrationPage]
class RegistrationRoute extends _i16.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({
    _i19.Key? key,
    required _i21.ChatAndAuthRepository chatAndAuthRepository,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          RegistrationRoute.name,
          args: RegistrationRouteArgs(
            key: key,
            chatAndAuthRepository: chatAndAuthRepository,
          ),
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const _i16.PageInfo<RegistrationRouteArgs> page =
      _i16.PageInfo<RegistrationRouteArgs>(name);
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({
    this.key,
    required this.chatAndAuthRepository,
  });

  final _i19.Key? key;

  final _i21.ChatAndAuthRepository chatAndAuthRepository;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key, chatAndAuthRepository: $chatAndAuthRepository}';
  }
}

/// generated route for
/// [_i13.SendAnimeInvitePage]
class SendAnimeInviteRoute
    extends _i16.PageRouteInfo<SendAnimeInviteRouteArgs> {
  SendAnimeInviteRoute({
    _i17.Key? key,
    required _i25.AnimeRepository animeRepository,
    required _i21.ChatAndAuthRepository chatAndAuthRepository,
    required String acceptId,
    required String proposedId,
    required String receiverId,
    required _i24.UserModelWithLastMessage userModel,
    required String receiverUsername,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          SendAnimeInviteRoute.name,
          args: SendAnimeInviteRouteArgs(
            key: key,
            animeRepository: animeRepository,
            chatAndAuthRepository: chatAndAuthRepository,
            acceptId: acceptId,
            proposedId: proposedId,
            receiverId: receiverId,
            userModel: userModel,
            receiverUsername: receiverUsername,
          ),
          initialChildren: children,
        );

  static const String name = 'SendAnimeInviteRoute';

  static const _i16.PageInfo<SendAnimeInviteRouteArgs> page =
      _i16.PageInfo<SendAnimeInviteRouteArgs>(name);
}

class SendAnimeInviteRouteArgs {
  const SendAnimeInviteRouteArgs({
    this.key,
    required this.animeRepository,
    required this.chatAndAuthRepository,
    required this.acceptId,
    required this.proposedId,
    required this.receiverId,
    required this.userModel,
    required this.receiverUsername,
  });

  final _i17.Key? key;

  final _i25.AnimeRepository animeRepository;

  final _i21.ChatAndAuthRepository chatAndAuthRepository;

  final String acceptId;

  final String proposedId;

  final String receiverId;

  final _i24.UserModelWithLastMessage userModel;

  final String receiverUsername;

  @override
  String toString() {
    return 'SendAnimeInviteRouteArgs{key: $key, animeRepository: $animeRepository, chatAndAuthRepository: $chatAndAuthRepository, acceptId: $acceptId, proposedId: $proposedId, receiverId: $receiverId, userModel: $userModel, receiverUsername: $receiverUsername}';
  }
}

/// generated route for
/// [_i14.SharePlayerPage]
class SharePlayerRoute extends _i16.PageRouteInfo<SharePlayerRouteArgs> {
  SharePlayerRoute({
    _i17.Key? key,
    required String animeStreamUrl,
    required String receiverUsername,
    required String receiverId,
    required _i24.UserModelWithLastMessage userModel,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          SharePlayerRoute.name,
          args: SharePlayerRouteArgs(
            key: key,
            animeStreamUrl: animeStreamUrl,
            receiverUsername: receiverUsername,
            receiverId: receiverId,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'SharePlayerRoute';

  static const _i16.PageInfo<SharePlayerRouteArgs> page =
      _i16.PageInfo<SharePlayerRouteArgs>(name);
}

class SharePlayerRouteArgs {
  const SharePlayerRouteArgs({
    this.key,
    required this.animeStreamUrl,
    required this.receiverUsername,
    required this.receiverId,
    required this.userModel,
  });

  final _i17.Key? key;

  final String animeStreamUrl;

  final String receiverUsername;

  final String receiverId;

  final _i24.UserModelWithLastMessage userModel;

  @override
  String toString() {
    return 'SharePlayerRouteArgs{key: $key, animeStreamUrl: $animeStreamUrl, receiverUsername: $receiverUsername, receiverId: $receiverId, userModel: $userModel}';
  }
}

/// generated route for
/// [_i15.SinglePlayerPage]
class SinglePlayerRoute extends _i16.PageRouteInfo<SinglePlayerRouteArgs> {
  SinglePlayerRoute({
    _i17.Key? key,
    required String animeStreamUrl,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          SinglePlayerRoute.name,
          args: SinglePlayerRouteArgs(
            key: key,
            animeStreamUrl: animeStreamUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'SinglePlayerRoute';

  static const _i16.PageInfo<SinglePlayerRouteArgs> page =
      _i16.PageInfo<SinglePlayerRouteArgs>(name);
}

class SinglePlayerRouteArgs {
  const SinglePlayerRouteArgs({
    this.key,
    required this.animeStreamUrl,
  });

  final _i17.Key? key;

  final String animeStreamUrl;

  @override
  String toString() {
    return 'SinglePlayerRouteArgs{key: $key, animeStreamUrl: $animeStreamUrl}';
  }
}
