import 'package:flutter/cupertino.dart';

class BotNavViewModel extends ChangeNotifier {
  int _currentPage = 0;

  final List<Widget> _children = [
    // TODO: Add screens here
    // HomeScreen(),
    // MyBookingScreen(),
    // MyWalletScreen(),
    // AccountSettings(),
  ];

  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  Widget get currentChild => _children[currentPage];
}
