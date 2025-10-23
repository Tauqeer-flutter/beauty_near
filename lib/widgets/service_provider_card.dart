import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';
import 'custom_chip.dart';

class ServiceProviderCard extends StatelessWidget {
  final VoidCallback? onTap;
  const ServiceProviderCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, barbarDetailScreen);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 12.h,
                children: [
                  SizedBox(
                    width: 90.h,
                    child: ClipOval(child: Image.asset(PngAssets.person,)),
                  ),
                  Text(
                    'John Smith',
                    style: TextStyle(
                      height: 0,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // SizedBox(height: 12.h),
                  CustomChip(label: 'Hair Spa'),
                  // SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.location5,
                        color: AppColors.kPrimaryColor,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'New York, NY',
                        style: TextStyle(
                          height: 0,
                          color: AppColors.greyColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Icon(Iconsax.star1, color: AppColors.gold, size: 14.sp),
                      SizedBox(width: 4.w),
                      Text(
                        '4.9',
                        style: TextStyle(
                          fontSize: 12.sp,
                          height: 0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
