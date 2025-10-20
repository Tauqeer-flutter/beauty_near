import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';
import 'route_generator.dart';
import 'utils/theme.dart';
import 'view_models/language_view_model.dart';
import 'view_models/theme_view_model.dart';

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMode themeMode = context.watch<ThemeViewModel>().themeMode;
    final Locale locale = context.watch<LanguageViewModel>().currentLocale;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'BeautyNear',
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      initialRoute: splashScreen,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: RouteGenerator.generateRoute,
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
    );
  }
}
