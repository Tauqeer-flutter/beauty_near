import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../services/locator.dart';
import '../services/storage_service.dart';

class LanguageViewModel extends ChangeNotifier {
  Locale currentLocale = Locale('en');

  Future<void> fetchInitialLocale() async {
    final savedLocale = locator<StorageService>().locale;
    if (savedLocale != null) {
      currentLocale = savedLocale;
      notifyListeners();
    }
  }

  Future<void> changeLocale(Locale newLocale) async {
    currentLocale = newLocale;
    notifyListeners();
    await locator<StorageService>().saveLocale(newLocale);
  }
}
