import 'package:beauty_near/route_generator.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';
import 'custom_chip.dart';

class DetailedServiceProviderCard extends StatelessWidget {
  const DetailedServiceProviderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, barbarDetailScreen);
        },
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  PngAssets.serviceProvider,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Text(
                    'Christopher Smith',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  CustomChip(
                    label: context.localization.availableNow,
                    backgroundColor: AppColors.greenAccent,
                    foregroundColor: AppColors.green,
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Icon(
                    Iconsax.location5,
                    color: AppColors.kPrimaryColor,
                    size: 16.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    context.localization.distance(10),
                    style: TextStyle(
                      color: AppColors.darkGreyColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Icon(Icons.circle, size: 5.sp),
                  ),
                  Icon(Iconsax.star1, color: AppColors.gold, size: 14.sp),
                  SizedBox(width: 4.w),
                  Text(
                    '4.9',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: AppColors.darkGreyColor,
                  ),
                  children: [
                    TextSpan(text: context.localization.minimumServicePrice),
                    TextSpan(
                      text: '\$100',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: AppColors.kBlackText,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                spacing: 12.w,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, barbarDetailScreen);
                      },
                      child: Text(context.localization.viewProfile),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(context.localization.bookNow),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
