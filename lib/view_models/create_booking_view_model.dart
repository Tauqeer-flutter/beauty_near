import 'package:flutter/material.dart';

import '../models/ui/service.dart';
import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/enums.dart';
import '../utils/extensions.dart';

class CreateBookingViewModel extends ChangeNotifier {
  ServiceType selectedService = ServiceType.haircut;
  List<Service> selectedServices = [];
  int selectedTabIndex = 0;

  final List<Service> services = [
    Service(
      name: navigatorKey.currentContext!.localization.haircut,
      duration: navigatorKey.currentContext!.localization.minsSession(60),
      price: '\$20',
      icon: SvgAssets.haircut,
      iconBackgroundColor: Color(0xFFF7E6EC),
    ),
    Service(
      name: navigatorKey.currentContext!.localization.shaving,
      duration: navigatorKey.currentContext!.localization.minsSession(60),
      price: '\$20',
      icon: SvgAssets.shaving,
      iconBackgroundColor: Color(0xFFFCEBEC),
    ),
    Service(
      name: navigatorKey.currentContext!.localization.haircut,
      duration: navigatorKey.currentContext!.localization.minsSession(60),
      price: '\$20',
      icon: SvgAssets.haircut,
      iconBackgroundColor: Color(0xFFF7E6EC),
    ),
    Service(
      name: navigatorKey.currentContext!.localization.shaving,
      duration: navigatorKey.currentContext!.localization.minsSession(60),
      price: '\$20',
      icon: SvgAssets.shaving,
      iconBackgroundColor: Color(0xFFFCEBEC),
    ),
    Service(
      name: navigatorKey.currentContext!.localization.haircut,
      duration: navigatorKey.currentContext!.localization.minsSession(60),
      price: '\$20',
      icon: SvgAssets.haircut,
      iconBackgroundColor: Color(0xFFF7E6EC),
    ),
    Service(
      name: navigatorKey.currentContext!.localization.shaving,
      duration: navigatorKey.currentContext!.localization.minsSession(60),
      price: '\$20',
      icon: SvgAssets.shaving,
      iconBackgroundColor: Color(0xFFFCEBEC),
    ),
    Service(
      name: navigatorKey.currentContext!.localization.haircut,
      duration: navigatorKey.currentContext!.localization.minsSession(60),
      price: '\$20',
      icon: SvgAssets.haircut,
      iconBackgroundColor: Color(0xFFF7E6EC),
    ),
    Service(
      name: navigatorKey.currentContext!.localization.shaving,
      duration: navigatorKey.currentContext!.localization.minsSession(60),
      price: '\$20',
      icon: SvgAssets.shaving,
      iconBackgroundColor: Color(0xFFFCEBEC),
    ),
  ];

  void setSelectedService(ServiceType service) {
    selectedService = service;
    notifyListeners();
  }

  void toggleServiceSelection(Service service) {
    if (selectedServices.contains(service)) {
      selectedServices.remove(service);
    } else {
      selectedServices.add(service);
    }
    notifyListeners();
  }

  bool isServiceSelected(Service service) {
    return selectedServices.contains(service);
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var service in selectedServices) {
      String priceString = service.price.replaceAll('\$', '');
      total += double.tryParse(priceString) ?? 0.0;
    }
    return total;
  }

  void clearSelectedServices() {
    selectedServices.clear();
    notifyListeners();
  }

  void setSelectedTab(int tabIndex) {
    selectedTabIndex = tabIndex;
    notifyListeners();
  }
}
