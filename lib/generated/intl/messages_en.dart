// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "anime_error_request": MessageLookupByLibrary.simpleMessage(
            "A data access error has occurred, you may need to check your Internet connection!"),
        "anime_search_empty_description": MessageLookupByLibrary.simpleMessage(
            "Nothing was found for your request, check your request and try again"),
        "anime_search_empty_title":
            MessageLookupByLibrary.simpleMessage("No anime found"),
        "app_name": MessageLookupByLibrary.simpleMessage("AnimeHub"),
        "description_error": MessageLookupByLibrary.simpleMessage(
            "Unfortunately, the description has not been added yet, but you can always contact us and let us know about it!"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "empty_answer_after_search": MessageLookupByLibrary.simpleMessage(
            "Nothing was found for your request!"),
        "empty_bd": MessageLookupByLibrary.simpleMessage(
            "You don\\\'t have any favorite anime yet, but you can add them!"),
        "empty_favorites_description": MessageLookupByLibrary.simpleMessage(
            "You can add your favorite anime after watching"),
        "empty_favorites_title":
            MessageLookupByLibrary.simpleMessage("There are no favorite anime"),
        "favorites_error": MessageLookupByLibrary.simpleMessage(
            "You can add anime to your favorites after watching"),
        "internet_error": MessageLookupByLibrary.simpleMessage(
            "You do not have an Internet connection!"),
        "no_internet": MessageLookupByLibrary.simpleMessage(
            "You might need to check your internet connection"),
        "not_in_player": MessageLookupByLibrary.simpleMessage(
            "Perhaps this anime is not in our player!"),
        "play_text": MessageLookupByLibrary.simpleMessage("Play"),
        "register": MessageLookupByLibrary.simpleMessage(" Register."),
        "registration": MessageLookupByLibrary.simpleMessage(" Registration"),
        "registrationStart":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account yet?"),
        "select_episode":
            MessageLookupByLibrary.simpleMessage("Select episode"),
        "title_chat": MessageLookupByLibrary.simpleMessage("Chat"),
        "title_detailed_information":
            MessageLookupByLibrary.simpleMessage("Detailed information"),
        "title_error":
            MessageLookupByLibrary.simpleMessage("An error has occurred"),
        "title_favorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "title_search": MessageLookupByLibrary.simpleMessage("Search"),
        "title_settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "title_watch": MessageLookupByLibrary.simpleMessage("Watch"),
        "username": MessageLookupByLibrary.simpleMessage("Username")
      };
}
