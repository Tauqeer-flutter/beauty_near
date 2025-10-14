import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/color_constant.dart';

class AccountTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  final bool showChevron;

  const AccountTile({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColors.strokeColor, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24.r),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              children: [
                SvgPicture.asset(iconPath, height: 44.h, width: 44.w),
                SizedBox(width: 12.w),
                // Title text
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimaryColor,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
                // Chevron right arrow
                if (showChevron)
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.textPrimaryColor,
                    size: 24.sp,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
