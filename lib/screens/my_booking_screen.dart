import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';
import '../widgets/booking_card.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  int selectedTabIndex = 0;
  final List<String> tabs = ['Request', 'Upcoming', 'Past'];

  // Shared booking data that persists across tabs
  List<Map<String, dynamic>> allBookings = [
    {
      'id': '1',
      'customerName': 'Customer Name',
      'amount': '\$648.00',
      'month': 'NOVEMBER',
      'day': '23',
      'dayName': 'Sun.',
      'status': 'pending', // pending, accepted, cancelled, completed
      'date': DateTime.now().add(Duration(days: 1)),
    },
    {
      'id': '2',
      'customerName': 'Customer Name',
      'amount': '\$648.00',
      'month': 'NOVEMBER',
      'day': '24',
      'dayName': 'Mon.',
      'status': 'pending',
      'date': DateTime.now().add(Duration(days: 2)),
    },
    {
      'id': '3',
      'customerName': 'Customer Name',
      'amount': '\$648.00',
      'month': 'NOVEMBER',
      'day': '25',
      'dayName': 'Tue.',
      'status': 'pending',
      'date': DateTime.now().add(Duration(days: 3)),
    },
    {
      'id': '4',
      'customerName': 'Customer Name',
      'amount': '\$648.00',
      'month': 'NOVEMBER',
      'day': '26',
      'dayName': 'Wed.',
      'status': 'pending',
      'date': DateTime.now().add(Duration(days: 4)),
    },
    {
      'id': '5',
      'customerName': 'Customer Name',
      'amount': '\$648.00',
      'month': 'NOVEMBER',
      'day': '27',
      'dayName': 'Thu.',
      'status': 'pending',
      'date': DateTime.now().add(Duration(days: 5)),
    },
    {
      'id': '6',
      'customerName': 'Customer Name',
      'amount': '\$648.00',
      'month': 'NOVEMBER',
      'day': '28',
      'dayName': 'Fri.',
      'status': 'pending',
      'date': DateTime.now().add(Duration(days: 6)),
    },
    // Past bookings
    {
      'id': '7',
      'customerName': 'Customer Name',
      'amount': '\$648.00',
      'month': 'NOVEMBER',
      'day': '15',
      'dayName': 'Fri.',
      'status': 'completed',
      'date': DateTime.now().subtract(Duration(days: 7)),
    },
    {
      'id': '8',
      'customerName': 'Customer Name',
      'amount': '\$648.00',
      'month': 'NOVEMBER',
      'day': '14',
      'dayName': 'Thu.',
      'status': 'pending',
      'date': DateTime.now().subtract(Duration(days: 8)),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: AppColors.kScaffoldColor,
        centerTitle: true,
        title: Text(
          "My Bookings",
          style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: tabs.asMap().entries.map((entry) {
                  int index = entry.key;
                  String tabName = entry.value;
                  bool isSelected = selectedTabIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      height: 35.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.r),
                        gradient: isSelected
                            ? LinearGradient(
                                colors: [
                                  AppColors.kPrimaryColor,
                                  Color(0xffDE6C75),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )
                            : null,
                        color: isSelected ? null : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          tabName,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : AppColors.darkGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                  bottom: context.notchAwareBottomPadding,
                ),
                itemCount: _getItemCount(),
                itemBuilder: (context, index) {
                  return _buildBookingCard(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingCard(BuildContext context, int index) {
    // Filter bookings based on selected tab
    List<Map<String, dynamic>> filteredBookings = _getFilteredBookings();

    if (index >= filteredBookings.length) {
      return SizedBox.shrink(); // Return empty widget if index is out of bounds
    }

    final booking = filteredBookings[index];

    return BookingCard(
      bookingId: booking['id'] as String,
      customerName: booking['customerName'] as String,
      amount: booking['amount'] as String,
      month: booking['month'] as String,
      day: booking['day'] as String,
      dayName: booking['dayName'] as String,
      status: booking['status'] as String,
      selectedTabIndex: selectedTabIndex,
      onStatusUpdate: _updateBookingStatus,
    );
  }

  int _getItemCount() {
    return _getFilteredBookings().length;
  }

  List<Map<String, dynamic>> _getFilteredBookings() {
    switch (selectedTabIndex) {
      case 0: // Request tab - show only pending bookings
        return allBookings
            .where((booking) => booking['status'] == 'pending')
            .toList();
      case 1: // Upcoming tab - show accepted, cancelled, and pending bookings
        return allBookings
            .where(
              (booking) =>
                  [
                    'accepted',
                    'cancelled',
                    'pending',
                  ].contains(booking['status']) &&
                  booking['date'].isAfter(DateTime.now()),
            )
            .toList();
      case 2: // Past tab - show completed and pending bookings from the past
        return allBookings
            .where(
              (booking) =>
                  ['completed', 'pending'].contains(booking['status']) &&
                  booking['date'].isBefore(DateTime.now()),
            )
            .toList();
      default:
        return [];
    }
  }

  void _updateBookingStatus(String bookingId, String newStatus) {
    setState(() {
      int index = allBookings.indexWhere(
        (booking) => booking['id'] == bookingId,
      );
      if (index != -1) {
        allBookings[index]['status'] = newStatus;
      }
    });
  }
}
