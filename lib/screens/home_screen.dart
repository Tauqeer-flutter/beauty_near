import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/color_constant.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 80.h,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hello Kelly',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Good Morning!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, notification);
              },
              child: Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 30,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Iconsax.notification,
                    size: 18.sp,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
