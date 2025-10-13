import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/color_constant.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onPressed;
  const SocialButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.kScaffoldColor,
          foregroundColor: Color(0xff374151),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: Color(0xffF0F0F0)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath, height: 20.h, width: 20.w),
            SizedBox(width: 8.w),
            Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff374151),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
