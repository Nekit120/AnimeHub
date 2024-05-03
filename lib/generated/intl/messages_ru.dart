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
        "app_name": MessageLookupByLibrary.simpleMessage("AnimeHub"),
        "description_error": MessageLookupByLibrary.simpleMessage(
            "К сожалению описание ещё не добавленно, но Вы всегда можете связаться с нами и сообщить об этом!"),
        "empty_answer_after_search": MessageLookupByLibrary.simpleMessage(
            "По вашему запросу ничего не найдено!"),
        "empty_bd": MessageLookupByLibrary.simpleMessage(
            "Пока что у вас нет любимых аниме, но вы можете их добавить!"),
        "internet_error": MessageLookupByLibrary.simpleMessage(
            "У вас отсутствует подключение к интернету!"),
        "not_in_player": MessageLookupByLibrary.simpleMessage(
            "Возможно это аниме нет в нашем плеере!"),
        "play_text": MessageLookupByLibrary.simpleMessage("Воспроизвести"),
        "select_episode":
            MessageLookupByLibrary.simpleMessage("Выберите эпизод"),
        "title_chat": MessageLookupByLibrary.simpleMessage("Чат"),
        "title_detailed_information":
            MessageLookupByLibrary.simpleMessage("Подробная информация"),
        "title_favorite": MessageLookupByLibrary.simpleMessage("Любимые"),
        "title_search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "title_settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "title_watch": MessageLookupByLibrary.simpleMessage("Просмотр")
      };
}
