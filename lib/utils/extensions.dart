import 'package:beauty_near/l10n/app_localizations_en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../l10n/app_localizations.dart';

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
