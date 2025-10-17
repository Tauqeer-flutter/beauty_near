import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';

class NotificationTile extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const NotificationTile({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 56.h,
                    width: 56.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.kPrimaryColor,
                        width: .5,
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 20.sp,
                      color: AppColors.kBlackText,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5.h,
                      children: [
                        if (title != null)
                          Text(
                            title!,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kBlackText,
                            ),
                          )
                        else
                          Container(
                            height: 15.h,
                            width: 150.w,
                            color: Colors.grey,
                            child: Center(),
                          ),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.kBlackText,
                            ),
                          )
                        else
                          Container(
                            height: 10.h,
                            width: 100.w,
                            color: Colors.grey,
                            child: Center(),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          height: 12.h,
                          width: 12.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        SizedBox(height: 30.h),

                        Text(
                          context.localization.smallMinutes(2),
                          style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
