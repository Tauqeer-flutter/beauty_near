import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'route_generator.dart';
import 'utils/theme.dart';
import 'view_models/theme_view_model.dart';

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMode themeMode = context.watch<ThemeViewModel>().themeMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BeautyNear',
      initialRoute: loginScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
    );
  }
}
