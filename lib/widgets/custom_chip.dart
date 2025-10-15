import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Color? backgroundColor, foregroundColor;
  const CustomChip({
    super.key,
    required this.label,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryAccent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Text(
        label,
        style: TextStyle(
          color: foregroundColor ?? AppColors.kPrimaryColor,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
