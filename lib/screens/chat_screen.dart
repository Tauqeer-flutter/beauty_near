import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../widgets/custom_app_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.localization.chat),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),

                  Row(
                    children: [
                      Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(PngAssets.person),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "John Deo",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kBlackText,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.more_vert, color: AppColors.kBlackText),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Divider(thickness: 0.h, color: AppColors.greyColor),
                  SizedBox(height: 15.h),
                  Text(
                    context.localization.today,
                    style: TextStyle(
                      fontSize: 10.h,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kBlackText,
                    ),
                  ),
                  SizedBox(height: 52.h),
                  chatBubbleReceive(),
                  SizedBox(height: 12.h),
                  chatBubbleReceive(),
                  SizedBox(height: 12.h),
                  chatBubbleSent(),
                  SizedBox(height: 12.h),
                  chatBubbleSent(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: context.localization.typeMessage,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: SvgPicture.asset(
                          SvgAssets.emojiIcon,
                          height: 24.h,
                          width: 24.w,
                          colorFilter: ColorFilter.mode(
                            Colors.grey[400]!,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                SvgPicture.asset(
                  SvgAssets.paperClip,
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 8.w),
                SvgPicture.asset(
                  SvgAssets.sendButton,
                  height: 48.h,
                  width: 48.w,
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }

  chatBubbleReceive() {
    return Align(
      alignment: AlignmentGeometry.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70.h),
              color: AppColors.kPrimaryColor.withValues(alpha: 0.1),
            ),
            padding: EdgeInsets.all(10.h),
            child: Text(
              "I need you to help me with the file.",
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimaryColor,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "15:00",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  chatBubbleSent() {
    return Align(
      alignment: AlignmentGeometry.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 204.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.h),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10.h),
            child: Text(
              "Which of the file? The one you gave me yesterday?",
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimaryColor,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "15:00",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
