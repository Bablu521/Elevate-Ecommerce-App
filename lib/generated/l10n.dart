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

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(
      _current != null,
      'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Connection timeout. Please try again later.`
  String get connectionTimeout {
    return Intl.message(
      'Connection timeout. Please try again later.',
      name: 'connectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Request timed out. Please try again.`
  String get sendTimeout {
    return Intl.message(
      'Request timed out. Please try again.',
      name: 'sendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Server took too long to respond.`
  String get receiveTimeout {
    return Intl.message(
      'Server took too long to respond.',
      name: 'receiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Bad certificate. Please check your device date/time.`
  String get badCertificate {
    return Intl.message(
      'Bad certificate. Please check your device date/time.',
      name: 'badCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error response from server`
  String get badResponse {
    return Intl.message(
      'Unexpected error response from server',
      name: 'badResponse',
      desc: '',
      args: [],
    );
  }

  /// `No response received from server.`
  String get noResponse {
    return Intl.message(
      'No response received from server.',
      name: 'noResponse',
      desc: '',
      args: [],
    );
  }

  /// `Failed to parse error response.`
  String get failedToParseResponse {
    return Intl.message(
      'Failed to parse error response.',
      name: 'failedToParseResponse',
      desc: '',
      args: [],
    );
  }

  /// `Request was cancelled. Please retry.`
  String get dioErrorCancel {
    return Intl.message(
      'Request was cancelled. Please retry.',
      name: 'dioErrorCancel',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Please check your internet connection.`
  String get connectionError {
    return Intl.message(
      'Network error. Please check your internet connection.',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred:`
  String get unknownError {
    return Intl.message(
      'An unexpected error occurred:',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `email is required`
  String get emailIsRequired {
    return Intl.message(
      'email is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `enter valid email`
  String get enterValidEmail {
    return Intl.message(
      'enter valid email',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `password is required`
  String get passwordIsRequired {
    return Intl.message(
      'password is required',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `password Not Matched`
  String get passwordNotMatched {
    return Intl.message(
      'password Not Matched',
      name: 'passwordNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid username`
  String get enterValidUsername {
    return Intl.message(
      'Enter valid username',
      name: 'enterValidUsername',
      desc: '',
      args: [],
    );
  }

  /// `Enter numbers only`
  String get enterNumbersOnly {
    return Intl.message(
      'Enter numbers only',
      name: 'enterNumbersOnly',
      desc: '',
      args: [],
    );
  }

  /// `Enter value must equal 11 digit`
  String get enterValueMustEqual11Digit {
    return Intl.message(
      'Enter value must equal 11 digit',
      name: 'enterValueMustEqual11Digit',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get emailLabel {
    return Intl.message('Email', name: 'emailLabel', desc: '', args: []);
  }

  /// `Enter your Email`
  String get emailHintText {
    return Intl.message(
      'Enter your Email',
      name: 'emailHintText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message('Password', name: 'passwordLabel', desc: '', args: []);
  }

  /// `Enter your Password`
  String get passwordHintText {
    return Intl.message(
      'Enter your Password',
      name: 'passwordHintText',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Forget password?`
  String get forgetPassword {
    return Intl.message(
      'Forget password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Dont't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Dont\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Continue as guest`
  String get continueAsGuest {
    return Intl.message(
      'Continue as guest',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
