import 'package:beauty_near/screens/barbar_detail_screen.dart';
import 'package:beauty_near/screens/barbar_list.dart';
import 'package:beauty_near/screens/create_booking_form_screen.dart';
import 'package:beauty_near/screens/create_booking_gender_screen.dart';
import 'package:beauty_near/screens/pay_in_cash.dart';
import 'package:beauty_near/screens/payment_method.dart';
import 'package:beauty_near/screens/select_services_order_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/about_us_screen.dart';
import 'screens/account_settings_screen.dart';
import 'screens/bot_nav_bar_page.dart';
import 'screens/chat_screen.dart';
import 'screens/home_screen.dart';
import 'screens/languages_screen.dart';
import 'screens/location_screen.dart';
import 'screens/login_screen.dart';
import 'screens/my_booking_details_screen.dart';
import 'screens/my_booking_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/personal_information_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/support_screen.dart';
import 'screens/terms_and_conditions_screen.dart';
import 'view_models/bot_nav_view_model.dart';

const String splashScreen = '/';
const String homeScreen = '/home_screen';
const String loginScreen = '/login';
const String signupScreen = '/signup_screen';
const String locationScreen = '/location';
const String botNavBar = '/bot_nav_bar';
const String accountSettingsScreen = '/account_settings';
const String languagesScreen = '/languages';
const String chatScreen = '/chat';
const String myBookingScreen = '/my_booking';
const String myBookingDetailsScreen = '/my_booking_details';
const String personalInformationScreen = "/personal_information_screen";
const String termsAndConditions = '/terms_and_conditions';
const String privacyPolicy = '/privacy_policy';
const String aboutUs = '/about_us';
const String support = '/support';
const String notification = '/notification';
const String createBookingGender = '/create_booking';
const String createBookingFormScreen = '/create_booking_form_screen';
const String barbarDetailScreen = '/barbar_detail_screen';
const String createBarbarList = '/create_barbar_list';
const String selectServicesOrderSummary = '/select_services_order_summary';
const String paymentMethod = '/payment_method';
const String payInCash = '/pay_in_cash';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: splashScreen),
          builder: (_) => SplashScreen(),
        );
      case BotNavPage.routeName:
        return MaterialPageRoute(
          settings: RouteSettings(name: BotNavPage.routeName),
          builder: (_) => ChangeNotifierProvider(
            create: (context) => BotNavViewModel(),
            child: BotNavPage(),
          ),
        );
      case homeScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: homeScreen),
          builder: (_) => HomeScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: loginScreen),
          builder: (_) => LoginScreen(),
        );
      case signupScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: signupScreen),
          builder: (_) => SignupScreen(),
        );
      case locationScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: locationScreen),
          builder: (_) => LocationScreen(),
        );
      case myBookingScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: myBookingScreen),
          builder: (_) => MyBookingScreen(),
        );
      case myBookingDetailsScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: myBookingDetailsScreen),
          builder: (_) =>
              MyBookingDetailScreen(isCompleted: args?['isCompleted'] ?? false),
        );
      case personalInformationScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: personalInformationScreen),
          builder: (_) => PersonalInformationScreen(),
        );
      case termsAndConditions:
        return MaterialPageRoute(
          settings: RouteSettings(name: termsAndConditions),
          builder: (_) => TermsAndConditionsScreen(),
        );
      case privacyPolicy:
        return MaterialPageRoute(
          settings: RouteSettings(name: privacyPolicy),
          builder: (_) => PrivacyPolicyScreen(),
        );
      case aboutUs:
        return MaterialPageRoute(
          settings: RouteSettings(name: aboutUs),
          builder: (_) => AboutUsScreen(),
        );
      case support:
        return MaterialPageRoute(
          settings: RouteSettings(name: support),
          builder: (_) => SupportScreen(),
        );
      case notification:
        return MaterialPageRoute(
          settings: RouteSettings(name: support),
          builder: (_) => NotificationScreen(),
        );

      case accountSettingsScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: accountSettingsScreen),
          builder: (_) => AccountSettings(),
        );
      case languagesScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: languagesScreen),
          builder: (_) => LanguagesScreen(),
        );
      case chatScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: chatScreen),
          builder: (_) => ChatScreen(),
        );
      case createBookingGender:
        return MaterialPageRoute(
          settings: RouteSettings(name: createBookingGender),
          builder: (_) => CreateBookingGenderScreen(),
        );
      case createBookingFormScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: createBookingGender),
          builder: (_) => CreateBookingFormScreen(),
        );
      case barbarDetailScreen:
        return MaterialPageRoute(
          settings: RouteSettings(name: barbarDetailScreen),
          builder: (_) => BarbarDetailScreen(),
        );
      case createBarbarList:
        return MaterialPageRoute(
          settings: RouteSettings(name: createBarbarList),
          builder: (_) => BarbarList(),
        );
      case selectServicesOrderSummary:
        return MaterialPageRoute(
          settings: RouteSettings(name: selectServicesOrderSummary),
          builder: (_) => SelectServicesOrderSummary(),
        );
      case paymentMethod:
        return MaterialPageRoute(
          settings: RouteSettings(name: paymentMethod),
          builder: (_) => PaymentMethod(),
        );
      case payInCash:
        return MaterialPageRoute(
          settings: RouteSettings(name: payInCash),
          builder: (_) => PayInCash(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(child: Text('ERROR')),
        );
      },
    );
  }
}
