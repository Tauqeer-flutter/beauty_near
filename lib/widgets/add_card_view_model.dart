import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddCardViewModel extends ChangeNotifier {
  String? _selectedCountry;
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  final List<String> _countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Germany',
  ];

  // Getters
  String? get selectedCountry => _selectedCountry;
  List<String> get countries => _countries;
  TextEditingController get dateController => _dateController;
  DateTime? get selectedDate => _selectedDate;

  // Methods
  void setSelectedCountry(String? country) {
    _selectedCountry = country;
    notifyListeners();
  }

  void clearSelectedCountry() {
    _selectedCountry = null;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365 * 10),
      ), // 10 years from now
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xffD9303C), // AppColors.kPrimaryColor
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xff1C1C1C), // AppColors.textPrimaryColor
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      _dateController.text =
          '${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year}';
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}
