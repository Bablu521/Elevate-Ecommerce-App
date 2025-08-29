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

  /// `Enter valid Egyptian Phone number`
  String get enterValidEgyptianPhoneNumber {
    return Intl.message(
      'Enter valid Egyptian Phone number',
      name: 'enterValidEgyptianPhoneNumber',
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

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
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

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
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

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Please enter your email associated to your account`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please enter your email associated to your account',
      name: 'pleaseEnterYourEmail',
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

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Email Verification`
  String get emailVerification {
    return Intl.message(
      'Email Verification',
      name: 'emailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your code that send to your email address`
  String get pleaseEnterYourVerificationCode {
    return Intl.message(
      'Please enter your code that send to your email address',
      name: 'pleaseEnterYourVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Invalid code`
  String get invalidCode {
    return Intl.message(
      'Invalid code',
      name: 'invalidCode',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive code?`
  String get didNotReceiveCode {
    return Intl.message(
      'Didn\'t receive code?',
      name: 'didNotReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must not be empty and must contain 6 characters with upper case letter and one number at least`
  String get passwordMustNotEmpty {
    return Intl.message(
      'Password must not be empty and must contain 6 characters with upper case letter and one number at least',
      name: 'passwordMustNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
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

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Password reset successfully`
  String get passwordResetSuccessfully {
    return Intl.message(
      'Password reset successfully',
      name: 'passwordResetSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message('Add to cart', name: 'addToCart', desc: '', args: []);
  }

  /// `All price include tax`
  String get allPriceIncludeTax {
    return Intl.message(
      'All price include tax',
      name: 'allPriceIncludeTax',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Bouquet Include`
  String get bouquetInclude {
    return Intl.message(
      'Bouquet Include',
      name: 'bouquetInclude',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Sort by`
  String get sortBy {
    return Intl.message('Sort by', name: 'sortBy', desc: '', args: []);
  }

  /// `Lowes Price`
  String get lowesPrice {
    return Intl.message('Lowes Price', name: 'lowesPrice', desc: '', args: []);
  }

  /// `Highest Price`
  String get highestPrice {
    return Intl.message(
      'Highest Price',
      name: 'highestPrice',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get newWord {
    return Intl.message('New', name: 'newWord', desc: '', args: []);
  }

  /// `Old`
  String get old {
    return Intl.message('Old', name: 'old', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
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
