import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';
import '../widgets/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28.h),
            Row(
              children: [
                Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                Spacer(),
                Container(
                  height: 32.h,
                  width: 102.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70.r),
                    gradient: AppColors.kPrimaryGradient,
                  ),
                  child: Center(
                    child: Text(
                      "Mark all as Read",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return NotificationTile(
                    title: "William Manager",
                    subtitle:
                        "It is a long established fact that a reader will be distracted",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
