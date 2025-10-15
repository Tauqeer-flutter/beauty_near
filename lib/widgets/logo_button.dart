import 'package:beauty_near/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The asset must be an svg.
class LogoButton extends StatelessWidget {
  final String asset;
  final String label;
  final VoidCallback onTap;
  final bool enabled;
  const LogoButton({
    super.key,
    required this.asset,
    required this.label,
    required this.onTap,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 125.w,
        decoration: BoxDecoration(
          color: enabled ? AppColors.kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(70.r),
        ),
        padding: EdgeInsets.all(5.w),
        child: Row(
          children: [
            Container(
              height: 30.h,
              width: 30.h,
              decoration: BoxDecoration(
                color: enabled ? Colors.white : AppColors.kPrimaryColor,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(5.r),
              child: SvgPicture.asset(
                asset,
                color: enabled ? AppColors.kPrimaryColor : Colors.white,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                color: enabled ? Colors.white : AppColors.kBlackText,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
