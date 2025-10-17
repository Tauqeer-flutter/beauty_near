import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';

class LocationScreen extends StatelessWidget {
  final VoidCallback onSuccess;
  const LocationScreen({super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 77.h),

              Text(
                context.localization.selectLocation,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: AppColors.textPrimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6.h),
              Text(
                context.localization.selectYourLocationToFindBarber,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.darkGreyColor,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32.h),

              Container(
                height: 336.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                    image: AssetImage(PngAssets.map),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.localization.enterLocation,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              TextField(decoration: InputDecoration(hintText: 'Your Location')),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: context.notchAwareBottomPadding,
          left: 20.w,
          right: 20.w,
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: onSuccess, child: Text('Next')),
        ),
      ),
    );
  }
}
