import 'package:beauty_near/utils/enums.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  final PageController pageController = PageController();
  ServiceType selectedService = ServiceType.all;

  void setSelectedService(ServiceType service) {
    selectedService = service;
    notifyListeners();
  }
}
