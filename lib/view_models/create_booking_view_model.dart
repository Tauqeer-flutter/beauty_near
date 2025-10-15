import 'package:beauty_near/utils/enums.dart';
import 'package:beauty_near/utils/assets.dart';
import 'package:beauty_near/widgets/service_card.dart';
import 'package:flutter/material.dart';

class CreateBookingViewModel extends ChangeNotifier {
  BarbarServiceType selectedService = BarbarServiceType.hair;
  List<Service> selectedServices = [];
  int selectedTabIndex = 0; // 0 for Services, 1 for Reviews

  final List<Service> services = [
    Service(
      name: 'Haircut',
      duration: '60 min session',
      price: '\$20',
      icon: SvgAssets.haircut,
      iconBackgroundColor: Color(0xFFF7E6EC),
    ),
    Service(
      name: 'Shaving',
      duration: '60 min session',
      price: '\$20',
      icon: SvgAssets.shaving,
      iconBackgroundColor: Color(0xFFFCEBEC),
    ),
    Service(
      name: 'Haircut',
      duration: '60 min session',
      price: '\$20',
      icon: SvgAssets.haircut,
      iconBackgroundColor: Color(0xFFF7E6EC),
    ),
    Service(
      name: 'Shaving',
      duration: '60 min session',
      price: '\$20',
      icon: SvgAssets.shaving,
      iconBackgroundColor: Color(0xFFFCEBEC),
    ),
    Service(
      name: 'Haircut',
      duration: '60 min session',
      price: '\$20',
      icon: SvgAssets.haircut,
      iconBackgroundColor: Color(0xFFF7E6EC),
    ),
    Service(
      name: 'Shaving',
      duration: '60 min session',
      price: '\$20',
      icon: SvgAssets.shaving,
      iconBackgroundColor: Color(0xFFFCEBEC),
    ),
    Service(
      name: 'Haircut',
      duration: '60 min session',
      price: '\$20',
      icon: SvgAssets.haircut,
      iconBackgroundColor: Color(0xFFF7E6EC),
    ),
    Service(
      name: 'Shaving',
      duration: '60 min session',
      price: '\$20',
      icon: SvgAssets.shaving,
      iconBackgroundColor: Color(0xFFFCEBEC),
    ),
  ];

  void setSelectedService(BarbarServiceType service) {
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