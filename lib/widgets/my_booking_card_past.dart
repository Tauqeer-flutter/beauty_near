
import 'package:beauty_near/utils/assets.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';

class MyBookingCardPast extends StatefulWidget {
  final String customerName;
  final String price;
  final String month;
  final String dayOfWeek;
  final String dayNumber;
  final VoidCallback? onViewDetails;
  final VoidCallback? onMarkComplete;

  const MyBookingCardPast({
    super.key,
    required this.customerName,
    required this.price,
    required this.month,
    required this.dayOfWeek,
    required this.dayNumber,
    this.onViewDetails,
    this.onMarkComplete,
  });

  @override
  State<MyBookingCardPast> createState() => _MyBookingCardPastState();
}

class _MyBookingCardPastState extends State<MyBookingCardPast> {
  bool isCompleted = false;

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
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Main content row
          Row(
            children: [
              // Left section - Customer info
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    // Customer image
                    Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.greyColor.withOpacity(0.3),
                      ),
                      child: Image.asset(PngAssets.person),
                    ),
                    SizedBox(width: 12.w),
                    // Customer name and price
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.customerName,
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Container(
                                width: 15.w,
                                height: 15.h,
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
                                widget.price,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textPrimaryColor,
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
              // Right section - Date info
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.month,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      widget.dayOfWeek,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      widget.dayNumber,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Bottom section - Action buttons
          if (!isCompleted)
            // Single "Mark as Complete" button
            GestureDetector(
              onTap: () {
                setState(() {
                  isCompleted = true;
                });
                widget.onMarkComplete?.call();
              },
              child: Container(
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.circular(70.r),
                ),
                child: Center(
                  child: Text(
                    'Mark as Complete',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            )
          else
            // Two buttons: "View Details" and "Completed"
            Row(
              children: [
                // View Details button
                Expanded(
                  child: GestureDetector(
                    onTap: widget.onViewDetails,
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
                // Completed button
                Container(
                  height: 40.h,
                  width: 94.w,
                  decoration: BoxDecoration(
                    color: AppColors.greenColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(70.r),
                  ),
                  child: Center(
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
