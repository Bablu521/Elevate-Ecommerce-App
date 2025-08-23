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
    final name =
        (locale.countryCode?.isEmpty ?? false)
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

  /// `Enter valid Egyptian Phone number`
  String get enterValidEgyptianPhoneNumber {
    return Intl.message(
      'Enter valid Egyptian Phone number',
      name: 'enterValidEgyptianPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `First name`
  String get firstName {
    return Intl.message('First name', name: 'firstName', desc: '', args: []);
  }

  /// `Enter first name`
  String get enterFirstName {
    return Intl.message(
      'Enter first name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message('Last name', name: 'lastName', desc: '', args: []);
  }

  /// `Enter last name`
  String get enterLastName {
    return Intl.message(
      'Enter last name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Creating an account, you agree to our `
  String get creatingAnAccountYouAgreeToOur {
    return Intl.message(
      'Creating an account, you agree to our ',
      name: 'creatingAnAccountYouAgreeToOur',
      desc: '',
      args: [],
    );
  }

  /// `Terms&Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms&Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `close`
  String get close {
    return Intl.message('close', name: 'close', desc: '', args: []);
  }

  /// `Registered Successfully!`
  String get registeredSuccessfully {
    return Intl.message(
      'Registered Successfully!',
      name: 'registeredSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
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
