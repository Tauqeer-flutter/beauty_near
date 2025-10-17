import 'package:beauty_near/utils/enums.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  ServiceType selectedService = ServiceType.haircut;

  void setSelectedService(ServiceType service) {
    selectedService = service;
    notifyListeners();
  }
}
