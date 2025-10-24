import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  late AnimationController animationController;
  bool isLanguageFetched = false;

  // Initialize the SplashViewModel with vsync (TickerProvider)
  SplashViewModel({required TickerProvider vsync}) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 800),
      lowerBound: 0,
      upperBound: 1,
    );
    animationController.forward(from: 0);
  }

  Future<void> fetchInitialLocale() async {
    // Simulate a network call or some async operation
    await Future.delayed(const Duration(seconds: 2));

    // Language fetched, update state
    isLanguageFetched = true;
    notifyListeners();
  }

  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
