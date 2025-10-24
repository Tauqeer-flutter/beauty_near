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
  int _adultsCount = 0;
  int _kidsCount = 0;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedEthnicity;

  // Getters
  int get adultsCount => _adultsCount;
  int get kidsCount => _kidsCount;
  DateTime? get selectedDate => _selectedDate;
  TimeOfDay? get selectedTime => _selectedTime;
  String? get selectedEthnicity => _selectedEthnicity;

  final List<String> ethnicities = [
    'White',
    'Black/African/Caribbean',
    'Asian',
  ];

  // Adults counter methods
  void incrementAdults() {
    _adultsCount++;
    notifyListeners();
  }

  void decrementAdults() {
    if (_adultsCount > 0) {
      _adultsCount--;
      notifyListeners();
    }
  }

  // Kids counter methods
  void incrementKids() {
    _kidsCount++;
    notifyListeners();
  }

  void decrementKids() {
    if (_kidsCount > 0) {
      _kidsCount--;
      notifyListeners();
    }
  }

  // Ethnicity selection
  void setEthnicity(String? ethnicity) {
    _selectedEthnicity = ethnicity;
    notifyListeners();
  }

  // Date selection
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      notifyListeners();
    }
  }

  // Time selection
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      _selectedTime = picked;
      notifyListeners();
    }
  }

  // Format date for display
  String getFormattedDate() {
    if (_selectedDate == null) return '';
    return '${_selectedDate!.day.toString().padLeft(2, '0')}/'
        '${_selectedDate!.month.toString().padLeft(2, '0')}/'
        '${_selectedDate!.year}';
  }

  // Format time for display
  String getFormattedTime(BuildContext context) {
    if (_selectedTime == null) return '';
    return _selectedTime!.format(context);
  }

  // Reset all values if needed
  void reset() {
    _adultsCount = 0;
    _kidsCount = 0;
    _selectedDate = null;
    _selectedTime = null;
    _selectedEthnicity = null;
    notifyListeners();
  }

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
