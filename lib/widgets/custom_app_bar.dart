import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: AppColors.kScaffoldColor,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.textPrimaryColor,
          fontSize: 19.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: 20.0.w),
        child: Container(
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffFFFFFF),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              color: Color(0xff292D32),
              size: 18.sp,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
