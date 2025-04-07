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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Tadamon`
  String get appName {
    return Intl.message(
      'Tadamon',
      name: 'appName',
      desc: 'Application name',
      args: [],
    );
  }

  /// `Supporting Palestine is a humanitarian duty. Boycotting companies supporting the occupation is a voice for freedom.`
  String get appDescription {
    return Intl.message(
      'Supporting Palestine is a humanitarian duty. Boycotting companies supporting the occupation is a voice for freedom.',
      name: 'appDescription',
      desc: 'Application description',
      args: [],
    );
  }

  /// `Application error`
  String get errorHandle {
    return Intl.message(
      'Application error',
      name: 'errorHandle',
      desc: 'Tadamon application error',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: 'Main title in the application',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: 'Search button',
      args: [],
    );
  }

  /// `Logs`
  String get logs {
    return Intl.message('Logs', name: 'logs', desc: 'Logs page', args: []);
  }

  /// `Scan Barcode`
  String get scanBarcode {
    return Intl.message(
      'Scan Barcode',
      name: 'scanBarcode',
      desc: 'Barcode scanning button',
      args: [],
    );
  }

  /// `Image Analysis`
  String get imageAnalysis {
    return Intl.message(
      'Image Analysis',
      name: 'imageAnalysis',
      desc: 'Image analysis',
      args: [],
    );
  }

  /// `Edit Text`
  String get editText {
    return Intl.message(
      'Edit Text',
      name: 'editText',
      desc: 'Text editing',
      args: [],
    );
  }

  /// `Palestine Map`
  String get palatineMap {
    return Intl.message(
      'Palestine Map',
      name: 'palatineMap',
      desc: 'Palestine map',
      args: [],
    );
  }

  /// `Donate to Gaza`
  String get donate {
    return Intl.message(
      'Donate to Gaza',
      name: 'donate',
      desc: 'Donate to Gaza button',
      args: [],
    );
  }

  /// `Reviewed Products`
  String get scanedProducts {
    return Intl.message(
      'Reviewed Products',
      name: 'scanedProducts',
      desc: 'Number of reviewed products',
      args: [],
    );
  }

  /// `Supported Products`
  String get supportedProducts {
    return Intl.message(
      'Supported Products',
      name: 'supportedProducts',
      desc: 'Number of supported products',
      args: [],
    );
  }

  /// `App Interface Color`
  String get systemTheme {
    return Intl.message(
      'App Interface Color',
      name: 'systemTheme',
      desc: 'Interface color settings',
      args: [],
    );
  }

  /// `Match System Theme`
  String get followSystemTheme {
    return Intl.message(
      'Match System Theme',
      name: 'followSystemTheme',
      desc: 'Match app color with system',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkTheme {
    return Intl.message(
      'Dark Mode',
      name: 'darkTheme',
      desc: 'Dark mode',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightTheme {
    return Intl.message(
      'Light Mode',
      name: 'lightTheme',
      desc: 'Light mode',
      args: [],
    );
  }

  /// `Switch to Dark Mode`
  String get switchToDarkTheme {
    return Intl.message(
      'Switch to Dark Mode',
      name: 'switchToDarkTheme',
      desc: 'Switch to dark mode',
      args: [],
    );
  }

  /// `Switch to Light Mode`
  String get switchToLightTheme {
    return Intl.message(
      'Switch to Light Mode',
      name: 'switchToLightTheme',
      desc: 'Switch to light mode',
      args: [],
    );
  }

  /// `Tadamon Offline`
  String get appOffLine {
    return Intl.message(
      'Tadamon Offline',
      name: 'appOffLine',
      desc: 'Application status when offline',
      args: [],
    );
  }

  /// `The app is offline.`
  String get appOffLineMassageDontRunning {
    return Intl.message(
      'The app is offline.',
      name: 'appOffLineMassageDontRunning',
      desc: 'Offline error message',
      args: [],
    );
  }

  /// `The app is running successfully.`
  String get appOnLineMassageRunning {
    return Intl.message(
      'The app is running successfully.',
      name: 'appOnLineMassageRunning',
      desc: 'Application running success message',
      args: [],
    );
  }

  /// `Please wait ...`
  String get appOflineLoading {
    return Intl.message(
      'Please wait ...',
      name: 'appOflineLoading',
      desc: 'Offline data loading',
      args: [],
    );
  }

  /// `Load Product List`
  String get enableOnline {
    return Intl.message(
      'Load Product List',
      name: 'enableOnline',
      desc: 'Load product list',
      args: [],
    );
  }

  /// `Running the app offline.`
  String get enableOnlineMassage {
    return Intl.message(
      'Running the app offline.',
      name: 'enableOnlineMassage',
      desc: 'Message when running offline',
      args: [],
    );
  }

  /// `Clear Logs`
  String get clearLogs {
    return Intl.message(
      'Clear Logs',
      name: 'clearLogs',
      desc: 'Clear logs',
      args: [],
    );
  }

  /// `Clear product logs in the app.`
  String get clearLogsMassage {
    return Intl.message(
      'Clear product logs in the app.',
      name: 'clearLogsMassage',
      desc: 'Clear product logs',
      args: [],
    );
  }

  /// `FAQ`
  String get howToUse {
    return Intl.message('FAQ', name: 'howToUse', desc: 'FAQ', args: []);
  }

  /// `Learn how to use the application.`
  String get howToUseMassage {
    return Intl.message(
      'Learn how to use the application.',
      name: 'howToUseMassage',
      desc: 'How to use the application',
      args: [],
    );
  }

  /// `Report a Product`
  String get reportProduct {
    return Intl.message(
      'Report a Product',
      name: 'reportProduct',
      desc: 'Report a product',
      args: [],
    );
  }

  /// `Help us improve the app.`
  String get reportProductMassage {
    return Intl.message(
      'Help us improve the app.',
      name: 'reportProductMassage',
      desc: 'Help improve the app',
      args: [],
    );
  }

  /// `Product Details`
  String get sheetTitleProductInfo {
    return Intl.message(
      'Product Details',
      name: 'sheetTitleProductInfo',
      desc: 'Product details title',
      args: [],
    );
  }

  /// `Developer`
  String get developer {
    return Intl.message(
      'Developer',
      name: 'developer',
      desc: 'Developer name',
      args: [],
    );
  }

  /// `Mostafa Mahmoud`
  String get mostafaMahmoud {
    return Intl.message(
      'Mostafa Mahmoud',
      name: 'mostafaMahmoud',
      desc: 'Full developer name',
      args: [],
    );
  }

  /// `ReadMe`
  String get readMe {
    return Intl.message(
      'ReadMe',
      name: 'readMe',
      desc: 'ReadMe button',
      args: [],
    );
  }

  /// `Link to the app repository on GitHub.`
  String get readMeMassage {
    return Intl.message(
      'Link to the app repository on GitHub.',
      name: 'readMeMassage',
      desc: 'GitHub repository link',
      args: [],
    );
  }

  /// `Latest Updates`
  String get letastUpdate {
    return Intl.message(
      'Latest Updates',
      name: 'letastUpdate',
      desc: 'Latest updates',
      args: [],
    );
  }

  /// `Check for updates and change log.`
  String get letestUpdateMassage {
    return Intl.message(
      'Check for updates and change log.',
      name: 'letestUpdateMassage',
      desc: 'Latest update details',
      args: [],
    );
  }

  /// `GitHub Ticket`
  String get githubTiket {
    return Intl.message(
      'GitHub Ticket',
      name: 'githubTiket',
      desc: 'Create a GitHub ticket',
      args: [],
    );
  }

  /// `Report an issue or suggest a new feature.`
  String get githubTiketMassage {
    return Intl.message(
      'Report an issue or suggest a new feature.',
      name: 'githubTiketMassage',
      desc: 'Report an issue or suggest a feature',
      args: [],
    );
  }

  /// `Telegram Channel`
  String get telegramChannel {
    return Intl.message(
      'Telegram Channel',
      name: 'telegramChannel',
      desc: 'Telegram channel',
      args: [],
    );
  }

  /// `Link to Telegram channel.`
  String get telegramChannelMassage {
    return Intl.message(
      'Link to Telegram channel.',
      name: 'telegramChannelMassage',
      desc: 'Telegram channel link',
      args: [],
    );
  }

  /// `About the App`
  String get about {
    return Intl.message(
      'About the App',
      name: 'about',
      desc: 'About the application',
      args: [],
    );
  }

  /// `About Tadamon App.`
  String get aboutTadamon {
    return Intl.message(
      'About Tadamon App.',
      name: 'aboutTadamon',
      desc: 'About Tadamon App',
      args: [],
    );
  }

  /// `Message from Developer`
  String get contactDev {
    return Intl.message(
      'Message from Developer',
      name: 'contactDev',
      desc: 'Contact developer button',
      args: [],
    );
  }

  /// `No message available currently.`
  String get devMassage {
    return Intl.message(
      'No message available currently.',
      name: 'devMassage',
      desc: 'Developer message',
      args: [],
    );
  }

  /// `Thank you for using Tadamon.`
  String get devThx {
    return Intl.message(
      'Thank you for using Tadamon.',
      name: 'devThx',
      desc: 'Thanks from developer',
      args: [],
    );
  }

  /// `Support the Developer.`
  String get devDonate {
    return Intl.message(
      'Support the Developer.',
      name: 'devDonate',
      desc: 'Donate to developer',
      args: [],
    );
  }

  /// `Follow me on social media.`
  String get contactDevMassage {
    return Intl.message(
      'Follow me on social media.',
      name: 'contactDevMassage',
      desc: 'Ways to contact the developer',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: 'Close button', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
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
