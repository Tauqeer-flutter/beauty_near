import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';
import 'app_back_button.dart';

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
        child: AppBackButton(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
