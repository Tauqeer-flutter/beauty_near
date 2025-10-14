import 'package:beauty_near/screens/notification_screen.dart';
import 'package:flutter/cupertino.dart';

import '../screens/account_settings_screen.dart';
import '../screens/home_screen.dart';
import '../screens/my_booking_screen.dart';

class BotNavViewModel extends ChangeNotifier {
  int _currentPage = 0;

  final List<Widget> _children = [
    // TODO: Add screens here
    HomeScreen(),
    MyBookingScreen(),
    NotificationScreen(),
    AccountSettings(),
  ];

  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  Widget get currentChild => _children[currentPage];
}
