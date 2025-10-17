import 'package:beauty_near/l10n/app_localizations_en.dart';
import 'package:beauty_near/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../l10n/app_localizations.dart';
import 'assets.dart';

extension ContextUtils on BuildContext {
  bool get hasBottomNotch {
    final mediaQuery = MediaQuery.of(this);
    final bottomPadding = mediaQuery.padding.bottom;
    return bottomPadding > 0;
  }

  double get bottomNotch {
    final mediaQuery = MediaQuery.of(this);
    return mediaQuery.padding.bottom;
  }

  double get notchAwareBottomPadding {
    if (bottomNotch > 0) {
      return 25.h + bottomNotch;
    } else {
      return 150.h;
    }
  }

  AppLocalizations get localization {
    final currentLocalization = AppLocalizations.of(this);
    if (currentLocalization == null) {
      return AppLocalizationsEn();
    }
    return currentLocalization;
  }
}

extension LocaleUtils on Locale {
  String get name {
    switch (languageCode) {
      case 'en':
        return 'English (US)';
      case 'fr':
        return 'Français';
      case 'es':
        return 'Español';
      default:
        throw Exception('Invalid language code: $languageCode');
    }
  }

  String get svg {
    switch (languageCode) {
      case 'en':
        return SvgAssets.us;
      case 'fr':
        return SvgAssets.french;
      case 'es':
        return SvgAssets.spanish;
      default:
        throw Exception('Invalid language code: $languageCode');
    }
  }
}

extension ServiceTypeUtils on ServiceType {
  String get label {
    return switch (this) {
      ServiceType.all => 'All Services',
      ServiceType.haircut => 'Haircut',
      ServiceType.shaving => 'Shaving',
      ServiceType.massage => 'Massage',
    };
  }
}
