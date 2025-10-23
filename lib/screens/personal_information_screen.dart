import 'package:beauty_near/utils/extensions.dart';
import 'package:beauty_near/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../utils/assets.dart';
import '../utils/color_constant.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kScaffoldColor,
        centerTitle: true,
        title: Text(
          context.localization.personalInfo,
          style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFFFFFF),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left,
                color: Color(0xff292D32),
                size: 18.sp,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Center(
                child: Consumer<AuthViewModel>(
                  builder: (context, authViewModel, _) {
                    return GestureDetector(
                      onTap: () async {
                        await authViewModel.setProfileImagePath(
                          context: context,
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 94.w,
                            height: 94.h,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: CircleAvatar(
                              radius: 38.r,
                              backgroundImage: AssetImage(PngAssets.person),
                            ),
                          ),
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: CircleAvatar(
                              radius: 12.r,
                              backgroundColor: Color(0xffEFC2C8),

                              child: Icon(
                                Iconsax.edit,
                                color: AppColors.kPrimaryColor,
                                size: 12.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                context.localization.enterName,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: context.localization.name,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                context.localization.emailAddress,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(hintText: "email@example.com"),
              ),
              SizedBox(height: 15.h),
              Text(
                context.localization.phoneNumber,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(hintText: "+123 4569 9630 0258"),
              ),
              SizedBox(height: 15.h),
              GestureDetector(
                // onTap: () => Navigator.pushNamed(context, changePassword),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70.r),
                    border: Border.all(
                      color:
                          AppColors.kPrimaryColor, // Set the border color here
                      width: 1.sp, // Optional: Set the border width
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        context.localization.changePassword,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.kPrimaryColor,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 25.h),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(context.localization.editProfile),
            ),
          ),
        ),
      ),
    );
  }
}
