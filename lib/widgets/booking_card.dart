import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';

class BookingCard extends StatelessWidget {
  final String bookingId;
  final String customerName;
  final String amount;
  final String month;
  final String day;
  final String dayName;
  final String status;
  final int selectedTabIndex;
  final Function(String bookingId, String newStatus) onStatusUpdate;

  const BookingCard({
    super.key,
    required this.bookingId,
    required this.customerName,
    required this.amount,
    required this.month,
    required this.day,
    required this.dayName,
    required this.status,
    required this.selectedTabIndex,
    required this.onStatusUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top section with customer info and date
          Row(
            children: [
              // Customer info section
              Expanded(
                child: Row(
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 25.r,

                      child: Image.asset(PngAssets.person),
                    ),
                    SizedBox(width: 12.w),
                    // Customer name and amount
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customerName,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Container(
                                width: 16.w,
                                height: 16.h,
                                decoration: BoxDecoration(
                                  color: AppColors.kPrimaryColor,
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                                child: Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                  size: 10.sp,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                amount,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.textPrimaryColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Date section
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    month,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    dayName,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    day,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Bottom section with view details button and action buttons
          Row(
            children: [
              // View Details button
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, myBookingDetailsScreen);
                  },
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.strokeColor,
                      borderRadius: BorderRadius.circular(70.r),
                    ),
                    child: Center(
                      child: Text(
                        'View Details',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              // Action buttons based on tab and status
              ..._buildActionButtons(context),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildActionButtons(BuildContext context) {
    switch (selectedTabIndex) {
      case 0: // Request tab
        return [
          // Accept button
          GestureDetector(
            onTap: () => onStatusUpdate(bookingId, 'accepted'),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Icon(Icons.check, color: Colors.green, size: 20.sp),
            ),
          ),
          SizedBox(width: 8.w),
          // Reject button
          GestureDetector(
            onTap: () => onStatusUpdate(bookingId, 'cancelled'),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Icon(
                Icons.close,
                color: AppColors.kPrimaryColor,
                size: 20.sp,
              ),
            ),
          ),
        ];

      case 1: // Upcoming tab
        switch (status) {
          case 'pending':
            return [
              // Accept button
              GestureDetector(
                onTap: () => onStatusUpdate(bookingId, 'accepted'),
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Icon(Icons.check, color: Colors.green, size: 20.sp),
                ),
              ),
              SizedBox(width: 8.w),
              // Reject button
              GestureDetector(
                onTap: () => onStatusUpdate(bookingId, 'cancelled'),
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Icon(
                    Icons.close,
                    color: AppColors.kPrimaryColor,
                    size: 20.sp,
                  ),
                ),
              ),
            ];
          case 'accepted':
            return [
              // Chat icon
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, chatScreen);
                },
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Icon(
                    Iconsax.message5,
                    color: AppColors.kPrimaryColor,
                    size: 20.sp,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              // Accepted button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Color(0xff00A12B).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Accepted',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xff00A12B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ];
          case 'cancelled':
            return [
              // Cancelled button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Color(0xffD9303C).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Cancelled',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ];
          default:
            return [];
        }

      case 2: // Past tab
        switch (status) {
          case 'completed':
            return [
              // Completed button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Color(0xff00A12B).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Completed',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xff00A12B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ];
          case 'pending':
            return [
              // Pending button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Color(0xffD9303C).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Pending',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ];
          default:
            return [];
        }

      default:
        return [];
    }
  }
}
