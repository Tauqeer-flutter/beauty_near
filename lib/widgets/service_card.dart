import 'package:auto_size_text/auto_size_text.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../models/ui/service.dart';

class ServiceCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onTap;
  final Service service;

  const ServiceCard({
    super.key,
    required this.service,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 168.w,
        height: 144.h,
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10.h,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(service.icon, height: 45.h, width: 45.w),
                    Container(
                      width: 14.w,
                      height: 14.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        shape: BoxShape.rectangle,
                        color: isSelected
                            ? AppColors.kPrimaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: AppColors.kPrimaryColor,

                          width: 1.w,
                        ),
                      ),
                      child: isSelected
                          ? Icon(
                              Icons.check,
                              color: AppColors.kScaffoldColor,
                              size: 12.sp,
                            )
                          : null,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      service.name,
                      maxLines: 1,
                      style: TextStyle(
                        height: 0,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                    Text(
                      service.duration,
                      style: TextStyle(
                        height: 0,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ],
                ),
                // Price
                Text(
                  service.price,
                  style: TextStyle(
                    height: 0,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
