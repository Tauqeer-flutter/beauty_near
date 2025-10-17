import 'package:beauty_near/route_generator.dart';
import 'package:beauty_near/utils/assets.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:beauty_near/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CreateBookingGenderScreen extends StatelessWidget {
  const CreateBookingGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localization.createBooking),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              context.localization.booking,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.kBlackText,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              context.localization.selectServiceType,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.kBlackText,
              ),
            ),
            SizedBox(height: 30.h),

            _buildGenderCard(
              title: context.localization.mensService,
              icon: SvgAssets.men,
              isSelected: false,
              onTap: () {
                Navigator.pushNamed(context, createBookingFormScreen);
              },
            ),
            SizedBox(height: 15.h),
            _buildGenderCard(
              title: context.localization.womensService,
              icon: SvgAssets.women,
              isSelected: false,
              onTap: () {
                Navigator.pushNamed(context, createBookingFormScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderCard({
    required String title,
    required String icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffFBE9EA),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, height: 32.h, width: 32.w),
            SizedBox(height: 10.h),

            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
                color: AppColors.textPrimaryColor,
                height: 1.22,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
