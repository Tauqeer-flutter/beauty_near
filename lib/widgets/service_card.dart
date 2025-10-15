import 'package:beauty_near/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Service {
  final String name;
  final String duration;
  final String price;
  final String icon;
  final Color iconBackgroundColor;

  Service({
    required this.name,
    required this.duration,
    required this.price,
    required this.icon,
    required this.iconBackgroundColor,
  });
}

// Service Card Widget
class ServiceCard extends StatelessWidget {
  final Service service;
  final bool isSelected;
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.service,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 168.w,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Selection indicator and Icon Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(service.icon, height: 45.h, width: 45.w),
                Container(
                  width: 14.w,
                  height: 14.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    shape: BoxShape.rectangle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.greenColor
                          : AppColors.textGreyColor,
                      width: 1.w,
                    ),
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          color: AppColors.greenColor,
                          size: 12.sp,
                        )
                      : null,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            // Text Section
            Text(
              service.name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: AppColors.textPrimaryColor,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              service.duration,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: AppColors.darkGreyColor,
              ),
            ),
            SizedBox(height: 10.h),
            // Price
            Text(
              service.price,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
