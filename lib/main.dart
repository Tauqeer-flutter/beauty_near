import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'app_init.dart';
import 'services/locator.dart';
import 'utils/screen_size.dart';
import 'view_models/create_booking_view_model.dart';
import 'view_models/home_view_model.dart';
import 'view_models/language_view_model.dart';
import 'view_models/theme_view_model.dart';
import 'widgets/add_card_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleFonts.pendingFonts([GoogleFonts.montserratTextTheme()]);
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initializeServices();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => CreateBookingViewModel()),
        ChangeNotifierProvider(create: (context) => AddCardViewModel()),
        ChangeNotifierProvider(create: (_) => LanguageViewModel(), lazy: false),
      ],
      child: ScreenUtilInit(
        designSize: getDesignSize(),
        minTextAdapt: true,
        ensureScreenSize: true,
        splitScreenMode: true,
        child: AppInit(),
      ),
    ),
  );
}
