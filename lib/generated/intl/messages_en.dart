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
    "continueAsGuest": MessageLookupByLibrary.simpleMessage(
      "Continue as guest",
    ),
    "dioErrorCancel": MessageLookupByLibrary.simpleMessage(
      "Request was cancelled. Please retry.",
    ),
    "emailIsRequired": MessageLookupByLibrary.simpleMessage(
      "email is required",
    ),
    "enterNumbersOnly": MessageLookupByLibrary.simpleMessage(
      "Enter numbers only",
    ),
    "enterValidEmail": MessageLookupByLibrary.simpleMessage(
      "enter valid email",
    ),
    "enterValidUsername": MessageLookupByLibrary.simpleMessage(
      "Enter valid username",
    ),
    "enterValueMustEqual11Digit": MessageLookupByLibrary.simpleMessage(
      "Enter value must equal 11 digit",
    ),
    "failedToParseResponse": MessageLookupByLibrary.simpleMessage(
      "Failed to parse error response.",
    ),
    "forgetPassword": MessageLookupByLibrary.simpleMessage("Forget password?"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "noResponse": MessageLookupByLibrary.simpleMessage(
      "No response received from server.",
    ),
    "passwordIsRequired": MessageLookupByLibrary.simpleMessage(
      "password is required",
    ),
    "passwordNotMatched": MessageLookupByLibrary.simpleMessage(
      "password Not Matched",
    ),
    "receiveTimeout": MessageLookupByLibrary.simpleMessage(
      "Server took too long to respond.",
    ),
    "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
    "sendTimeout": MessageLookupByLibrary.simpleMessage(
      "Request timed out. Please try again.",
    ),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "thisFieldIsRequired": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "An unexpected error occurred:",
    ),
  };
}
