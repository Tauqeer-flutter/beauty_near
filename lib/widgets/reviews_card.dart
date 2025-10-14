import 'package:beauty_near/utils/assets.dart';
import 'package:beauty_near/utils/color_constant.dart';
import 'package:beauty_near/widgets/circular_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children: [
              CircularImageWidget(
                height: 38.h,
                width: 38.w,
                image: PngAssets.person,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Courtney Henry",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        fiveStarRow(),
                        SizedBox(width: 4.w),
                        Text(
                          "2 mins ago",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert),
            ],
          ),
          SizedBox(height: 13.h),
          Text(
            "Consequat velit qui adipisicing sunt do rependerit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20.h),
          Divider(color: AppColors.greyColor),
        ],
      ),
    );
  }
  fiveStarRow() {
    return Row(
      children: [
        Icon(Iconsax.star1, size: 16.sp, color: Color(0XffDBA300)),
        Icon(Iconsax.star1, size: 16.sp, color: Color(0XffDBA300)),
        Icon(Iconsax.star1, size: 16.sp, color: Color(0XffDBA300)),
        Icon(Iconsax.star1, size: 16.sp, color: Color(0XffDBA300)),
        Icon(Iconsax.star1, size: 16.sp, color: Colors.grey),
      ],
    );
  }
}