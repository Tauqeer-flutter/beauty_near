// my_booking_viewmodel.dart
import 'package:flutter/material.dart';

class MyBookingViewModel extends ChangeNotifier {
  bool _isUpcomingSelected = true;

  // Getters
  bool get isUpcomingSelected => _isUpcomingSelected;

  // Sample data for demonstration
  // In a real app, you'd fetch this from a repository/API
  final List<BookingModel> upcomingBookings = [
    BookingModel(
      customerName: 'Customer Name',
      price: '\$648.00',
      month: 'NOVEMBER',
      dayOfWeek: 'Sun.',
      dayNumber: '23',
    ),
    BookingModel(
      customerName: 'Customer Name',
      price: '\$648.00',
      month: 'NOVEMBER',
      dayOfWeek: 'Sun.',
      dayNumber: '23',
    ),
    BookingModel(
      customerName: 'Customer Name',
      price: '\$648.00',
      month: 'NOVEMBER',
      dayOfWeek: 'Sun.',
      dayNumber: '23',
    ),
    BookingModel(
      customerName: 'Customer Name',
      price: '\$648.00',
      month: 'NOVEMBER',
      dayOfWeek: 'Sun.',
      dayNumber: '23',
    ),
  ];

  final List<BookingModel> pastBookings = [
    BookingModel(
      customerName: 'Customer Name',
      price: '\$450.00',
      month: 'OCTOBER',
      dayOfWeek: 'Mon.',
      dayNumber: '15',
    ),
    BookingModel(
      customerName: 'Customer Name',
      price: '\$320.00',
      month: 'OCTOBER',
      dayOfWeek: 'Wed.',
      dayNumber: '10',
    ),
    BookingModel(
      customerName: 'Customer Name',
      price: '\$580.00',
      month: 'SEPTEMBER',
      dayOfWeek: 'Fri.',
      dayNumber: '28',
    ),
    BookingModel(
      customerName: 'Customer Name',
      price: '\$280.00',
      month: 'SEPTEMBER',
      dayOfWeek: 'Tue.',
      dayNumber: '18',
    ),
  ];

  // Get current bookings based on selected tab
  List<BookingModel> get currentBookings {
    return _isUpcomingSelected ? upcomingBookings : pastBookings;
  }

  // Tab selection methods
  void selectUpcomingTab() {
    if (!_isUpcomingSelected) {
      _isUpcomingSelected = true;
      notifyListeners();
    }
  }

  void selectPastTab() {
    if (_isUpcomingSelected) {
      _isUpcomingSelected = false;
      notifyListeners();
    }
  }

  // Booking actions
  void cancelBooking(int index) {
    // Implement your cancel booking logic here
    // For example: call API, update local state, etc.
    print('Cancel booking $index');

    // If you want to remove the booking from the list:
    // upcomingBookings.removeAt(index);
    // notifyListeners();
  }

  void markBookingAsComplete(int index) {
    // Implement your mark as complete logic here
    print('Mark as complete for past booking $index');

    // You might want to move booking from past to completed
    // or update its status
    // notifyListeners();
  }

  // Navigation handlers
  void navigateToBookingDetails(BuildContext context, bool isCompleted) {
    Navigator.pushNamed(
      context,
      '/myBookingDetailsScreen', // Replace with your route constant
      arguments: {'isCompleted': isCompleted},
    );
  }

  // Optional: Method to refresh bookings from API
  Future<void> refreshBookings() async {
    // Implement API call to fetch latest bookings
    // Update upcomingBookings and pastBookings
    // notifyListeners();
  }
}

// Booking Model class
class BookingModel {
  final String customerName;
  final String price;
  final String month;
  final String dayOfWeek;
  final String dayNumber;

  BookingModel({
    required this.customerName,
    required this.price,
    required this.month,
    required this.dayOfWeek,
    required this.dayNumber,
  });

  // You can add fromJson, toJson methods here if needed
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      customerName: json['customerName'],
      price: json['price'],
      month: json['month'],
      dayOfWeek: json['dayOfWeek'],
      dayNumber: json['dayNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerName': customerName,
      'price': price,
      'month': month,
      'dayOfWeek': dayOfWeek,
      'dayNumber': dayNumber,
    };
  }
}
