import 'package:beauty_near/screens/barbar_detail_screen.dart';
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
      title: 'Beauty Points',
      home: BarbarDetailScreen(),
      // initialRoute: loginScreen,
      // onGenerateRoute: RouteGenerator.generateRoute,
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
