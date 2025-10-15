import 'package:beauty_near/route_generator.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:beauty_near/widgets/my_booking_card.dart';
import 'package:beauty_near/widgets/my_booking_card_past.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  bool isUpcomingSelected = true;

  // Sample data for demonstration
  final List<Map<String, String>> upcomingBookings = [
    {
      'customerName': 'Customer Name',
      'price': '\$648.00',
      'month': 'NOVEMBER',
      'dayOfWeek': 'Sun.',
      'dayNumber': '23',
    },
    {
      'customerName': 'Customer Name',
      'price': '\$648.00',
      'month': 'NOVEMBER',
      'dayOfWeek': 'Sun.',
      'dayNumber': '23',
    },
    {
      'customerName': 'Customer Name',
      'price': '\$648.00',
      'month': 'NOVEMBER',
      'dayOfWeek': 'Sun.',
      'dayNumber': '23',
    },
    {
      'customerName': 'Customer Name',
      'price': '\$648.00',
      'month': 'NOVEMBER',
      'dayOfWeek': 'Sun.',
      'dayNumber': '23',
    },
  ];

  final List<Map<String, String>> pastBookings = [
    {
      'customerName': 'Customer Name',
      'price': '\$450.00',
      'month': 'OCTOBER',
      'dayOfWeek': 'Mon.',
      'dayNumber': '15',
    },
    {
      'customerName': 'Customer Name',
      'price': '\$320.00',
      'month': 'OCTOBER',
      'dayOfWeek': 'Wed.',
      'dayNumber': '10',
    },
    {
      'customerName': 'Customer Name',
      'price': '\$580.00',
      'month': 'SEPTEMBER',
      'dayOfWeek': 'Fri.',
      'dayNumber': '28',
    },
    {
      'customerName': 'Customer Name',
      'price': '\$280.00',
      'month': 'SEPTEMBER',
      'dayOfWeek': 'Tue.',
      'dayNumber': '18',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: Text(
          "My Bookings",
          style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            // Tab navigation
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isUpcomingSelected = true;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      height: 35.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.r),
                        gradient: isUpcomingSelected
                            ? AppColors.kPrimaryGradient
                            : null,
                        color: isUpcomingSelected ? null : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Upcoming",
                          style: TextStyle(
                            color: isUpcomingSelected
                                ? Colors.white
                                : AppColors.greyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.h),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isUpcomingSelected = false;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      height: 35.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.r),
                        gradient: !isUpcomingSelected
                            ? AppColors.kPrimaryGradient
                            : null,
                        color: !isUpcomingSelected ? null : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Past",
                          style: TextStyle(
                            color: !isUpcomingSelected
                                ? Colors.white
                                : AppColors.greyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            // ListView with booking cards
            Expanded(
              child: ListView.builder(
                itemCount: upcomingBookings.length,
                padding: EdgeInsets.only(
                  bottom: context.notchAwareBottomPadding,
                ),
                itemBuilder: (context, index) {
                  final booking = upcomingBookings[index];

                  if (isUpcomingSelected) {
                    return MyBookingCard(
                      customerName: booking['customerName']!,
                      price: booking['price']!,
                      month: booking['month']!,
                      dayOfWeek: booking['dayOfWeek']!,
                      dayNumber: booking['dayNumber']!,
                      onViewDetails: () {
                        Navigator.pushNamed(
                          context,
                          myBookingDetailsScreen,
                          arguments: {'isCompleted': false},
                        );
                      },
                      onCancel: () {
                        // Handle cancel booking
                        print('Cancel booking $index');
                      },
                    );
                  } else {
                    return MyBookingCardPast(
                      customerName: booking['customerName']!,
                      price: booking['price']!,
                      month: booking['month']!,
                      dayOfWeek: booking['dayOfWeek']!,
                      dayNumber: booking['dayNumber']!,
                      onViewDetails: () {
                        Navigator.pushNamed(
                          context,
                          myBookingDetailsScreen,
                          arguments: {'isCompleted': true},
                        );
                      },
                      onMarkComplete: () {
                        // Handle mark as complete
                        print('Mark as complete for past booking $index');
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
