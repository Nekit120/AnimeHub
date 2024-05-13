// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Favorite`
  String get title_favorite {
    return Intl.message(
      'Favorite',
      name: 'title_favorite',
      desc: '',
      args: [],
    );
  }

  /// `Watch`
  String get title_watch {
    return Intl.message(
      'Watch',
      name: 'title_watch',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get title_chat {
    return Intl.message(
      'Chat',
      name: 'title_chat',
      desc: '',
      args: [],
    );
  }

  /// `AnimeHub`
  String get app_name {
    return Intl.message(
      'AnimeHub',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get title_search {
    return Intl.message(
      'Search',
      name: 'title_search',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get title_settings {
    return Intl.message(
      'Settings',
      name: 'title_settings',
      desc: '',
      args: [],
    );
  }

  /// `A data access error has occurred, you may need to check your Internet connection!`
  String get anime_error_request {
    return Intl.message(
      'A data access error has occurred, you may need to check your Internet connection!',
      name: 'anime_error_request',
      desc: '',
      args: [],
    );
  }

  /// `Select episode`
  String get select_episode {
    return Intl.message(
      'Select episode',
      name: 'select_episode',
      desc: '',
      args: [],
    );
  }

  /// `Play`
  String get play_text {
    return Intl.message(
      'Play',
      name: 'play_text',
      desc: '',
      args: [],
    );
  }

  /// `Unfortunately, the description has not been added yet, but you can always contact us and let us know about it!`
  String get description_error {
    return Intl.message(
      'Unfortunately, the description has not been added yet, but you can always contact us and let us know about it!',
      name: 'description_error',
      desc: '',
      args: [],
    );
  }

  /// `Perhaps this anime is not in our player!`
  String get not_in_player {
    return Intl.message(
      'Perhaps this anime is not in our player!',
      name: 'not_in_player',
      desc: '',
      args: [],
    );
  }

  /// `You do not have an Internet connection!`
  String get internet_error {
    return Intl.message(
      'You do not have an Internet connection!',
      name: 'internet_error',
      desc: '',
      args: [],
    );
  }

  /// `You don\'t have any favorite anime yet, but you can add them!`
  String get empty_bd {
    return Intl.message(
      'You don\\\'t have any favorite anime yet, but you can add them!',
      name: 'empty_bd',
      desc: '',
      args: [],
    );
  }

  /// `Nothing was found for your request!`
  String get empty_answer_after_search {
    return Intl.message(
      'Nothing was found for your request!',
      name: 'empty_answer_after_search',
      desc: '',
      args: [],
    );
  }

  /// `Detailed information`
  String get title_detailed_information {
    return Intl.message(
      'Detailed information',
      name: 'title_detailed_information',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred`
  String get title_error {
    return Intl.message(
      'An error has occurred',
      name: 'title_error',
      desc: '',
      args: [],
    );
  }

  /// `You might need to check your internet connection`
  String get no_internet {
    return Intl.message(
      'You might need to check your internet connection',
      name: 'no_internet',
      desc: '',
      args: [],
    );
  }

  /// `You can add anime to your favorites after watching`
  String get favorites_error {
    return Intl.message(
      'You can add anime to your favorites after watching',
      name: 'favorites_error',
      desc: '',
      args: [],
    );
  }

  /// `There are no favorite anime`
  String get empty_favorites_title {
    return Intl.message(
      'There are no favorite anime',
      name: 'empty_favorites_title',
      desc: '',
      args: [],
    );
  }

  /// `You can add your favorite anime after watching`
  String get empty_favorites_description {
    return Intl.message(
      'You can add your favorite anime after watching',
      name: 'empty_favorites_description',
      desc: '',
      args: [],
    );
  }

  /// `No anime found`
  String get anime_search_empty_title {
    return Intl.message(
      'No anime found',
      name: 'anime_search_empty_title',
      desc: '',
      args: [],
    );
  }

  /// `Nothing was found for your request, check your request and try again`
  String get anime_search_empty_description {
    return Intl.message(
      'Nothing was found for your request, check your request and try again',
      name: 'anime_search_empty_description',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
