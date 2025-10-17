import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  SharedPreferences? _prefs;

  static const String _themeModeKey = 'theme-mode';
  static const String _languageKey = 'language';

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<ThemeMode> getThemeMode() async {
    final int? index = _prefs!.getInt(_themeModeKey);
    if (index == null) {
      return ThemeMode.system;
    }
    return ThemeMode.values[index];
  }

  Future<void> saveThemeMode(ThemeMode? mode) async {
    if (mode == null) {
      return;
    }
    await _prefs!.setInt(_themeModeKey, mode.index);
  }

  Future<void> saveLocale(Locale? locale) async {
    if (locale == null) {
      return;
    }
    await _prefs!.setString(_languageKey, locale.languageCode);
  }

  Locale? get locale {
    final langString = _prefs!.getString(_languageKey);
    if (langString == null) {
      return null;
    }
    return Locale(langString);
  }
}
