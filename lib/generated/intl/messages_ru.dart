// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "anime_error_request": MessageLookupByLibrary.simpleMessage(
            "Произошла ошибка доступа к данным, возможно Вам стоит проверить подключение к интернету!"),
        "anime_search_empty_description": MessageLookupByLibrary.simpleMessage(
            "По вашему запросу ничего не найдено, проверьте ваш запрос и попробуйте ещё раз"),
        "anime_search_empty_title":
            MessageLookupByLibrary.simpleMessage("Аниме не найдено"),
        "app_name": MessageLookupByLibrary.simpleMessage("AnimeHub"),
        "description_error": MessageLookupByLibrary.simpleMessage(
            "К сожалению описание ещё не добавленно, но Вы всегда можете связаться с нами и сообщить об этом!"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "empty_answer_after_search": MessageLookupByLibrary.simpleMessage(
            "По вашему запросу ничего не найдено!"),
        "empty_bd": MessageLookupByLibrary.simpleMessage(
            "Пока что у вас нет любимых аниме, но вы можете их добавить!"),
        "empty_favorites_description": MessageLookupByLibrary.simpleMessage(
            "Вы можете добавить любимые аниме после просмотра"),
        "empty_favorites_title":
            MessageLookupByLibrary.simpleMessage("Любимые аниме отсутствуют"),
        "favorites_error": MessageLookupByLibrary.simpleMessage(
            "You can add anime to your favorites after watching"),
        "internet_error": MessageLookupByLibrary.simpleMessage(
            "У вас отсутствует подключение к интернету!"),
        "no_internet": MessageLookupByLibrary.simpleMessage(
            "Возможно вам стоит проверить подключение к интернету"),
        "not_in_player": MessageLookupByLibrary.simpleMessage(
            "Возможно это аниме нет в нашем плеере!"),
        "play_text": MessageLookupByLibrary.simpleMessage("Воспроизвести"),
        "register": MessageLookupByLibrary.simpleMessage(" Зарегистрируйтесь."),
        "registration": MessageLookupByLibrary.simpleMessage("Регистрация"),
        "registrationStart":
            MessageLookupByLibrary.simpleMessage("У вас ещё нет аккаунта?"),
        "select_episode":
            MessageLookupByLibrary.simpleMessage("Выберите эпизод"),
        "title_chat": MessageLookupByLibrary.simpleMessage("Чат"),
        "title_detailed_information":
            MessageLookupByLibrary.simpleMessage("Подробная информация"),
        "title_error": MessageLookupByLibrary.simpleMessage("Произошла ошибка"),
        "title_favorite": MessageLookupByLibrary.simpleMessage("Любимые"),
        "title_search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "title_settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "title_watch": MessageLookupByLibrary.simpleMessage("Просмотр")
      };
}
