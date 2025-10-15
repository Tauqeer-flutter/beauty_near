import 'package:beauty_near/route_generator.dart';
import 'package:beauty_near/screens/bot_nav_bar_page.dart';
import 'package:beauty_near/screens/congratulations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../widgets/custom_back_button.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

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
                'Select Location',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: AppColors.textPrimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6.h),
              Text(
                'Select your Location to find nearby Barbers',
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
                  'Enter Location',
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
        padding: EdgeInsets.only(bottom: 24.h, left: 20.w, right: 20.w),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                congratulationsScreen,
                (_) => false,
              );
            },
            child: Text('Next'),
          ),
        ),
      ),
    );
  }
}
