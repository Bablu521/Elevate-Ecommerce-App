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
    "badCertificate": MessageLookupByLibrary.simpleMessage(
      "Bad certificate. Please check your device date/time.",
    ),
    "badResponse": MessageLookupByLibrary.simpleMessage(
      "Unexpected error response from server",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage(
      "Network error. Please check your internet connection.",
    ),
    "connectionTimeout": MessageLookupByLibrary.simpleMessage(
      "Connection timeout. Please try again later.",
    ),
    "dioErrorCancel": MessageLookupByLibrary.simpleMessage(
      "Request was cancelled. Please retry.",
    ),
    "failedToParseResponse": MessageLookupByLibrary.simpleMessage(
      "Failed to parse error response.",
    ),
    "noResponse": MessageLookupByLibrary.simpleMessage(
      "No response received from server.",
    ),
    "receiveTimeout": MessageLookupByLibrary.simpleMessage(
      "Server took too long to respond.",
    ),
    "sendTimeout": MessageLookupByLibrary.simpleMessage(
      "Request timed out. Please try again.",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "An unexpected error occurred:",
    ),
  };
}
