import 'package:beauty_near/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinkText extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const LinkText({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.kPrimaryColor,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
