import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../services/locator.dart';
import '../services/storage_service.dart';

class LanguageViewModel extends ChangeNotifier {
  Locale currentLocale = const Locale('en');

  // Available languages
  static const List<Map<String, String>> availableLanguages = [
    {'code': 'en', 'name': 'EN', 'fullName': 'English', 'flag': '🇺🇸'},
    {'code': 'es', 'name': 'ES', 'fullName': 'Español', 'flag': '🇪🇸'},
    {'code': 'fr', 'name': 'FR', 'fullName': 'Français', 'flag': '🇫🇷'},
  ];

  String get currentLanguageName {
    final language = availableLanguages.firstWhere(
      (lang) => lang['code'] == currentLocale.languageCode,
      orElse: () => availableLanguages.first,
    );
    return language['name']!;
  }

  String get currentLanguageFlag {
    final language = availableLanguages.firstWhere(
      (lang) => lang['code'] == currentLocale.languageCode,
      orElse: () => availableLanguages.first,
    );
    return language['flag']!;
  }

  Future<void> fetchInitialLocale() async {
    // Load saved locale from storage, default to English
    final savedLocale = await locator<StorageService>().getLocale();
    if (savedLocale != null) {
      currentLocale = savedLocale;
    } else {
      currentLocale = const Locale('en');
    }
    notifyListeners();
  }

  Future<void> changeLocale(Locale newLocale) async {
    currentLocale = newLocale;
    notifyListeners();
    await locator<StorageService>().saveLocale(newLocale);
  }
}
