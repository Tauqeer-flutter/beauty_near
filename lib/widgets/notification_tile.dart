import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const NotificationTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15.h),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              height: 56.h,
              width: 56.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.kPrimaryColor, width: .5),
              ),
              child: Icon(
                Icons.person,
                size: 20.sp,
                color: AppColors.kBlackText,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kBlackText,
                    ),
                  ),

                  Text(
                    subtitle,
                    // maxLines: 3,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.kBlackText,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: 12.h,
                  width: 12.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                SizedBox(height: 31.h),
                Text(
                  context.localization.smallMinutes(2),
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
