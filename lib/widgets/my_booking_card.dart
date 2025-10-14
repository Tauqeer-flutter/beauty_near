import 'package:beauty_near/utils/assets.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookingCard extends StatelessWidget {
  final String customerName;
  final String price;
  final String month;
  final String dayOfWeek;
  final String dayNumber;
  final VoidCallback? onViewDetails;
  final VoidCallback? onCancel;

  const MyBookingCard({
    super.key,
    required this.customerName,
    required this.price,
    required this.month,
    required this.dayOfWeek,
    required this.dayNumber,
    this.onViewDetails,
    this.onCancel,
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
                            customerName,
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
                                price,
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
                      month,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      dayOfWeek,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      dayNumber,
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
          Row(
            children: [
              // View Details button
              Expanded(
                child: InkWell(
                  onTap: () {},
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
              // Cancel button
              GestureDetector(
                onTap: onCancel,
                child: Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    color: AppColors.kPrimaryColor,
                    size: 18.sp,
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
