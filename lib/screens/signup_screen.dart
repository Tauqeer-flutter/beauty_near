import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../widgets/social_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h),
              Center(
                child: SvgPicture.asset(
                  SvgAssets.logo,
                  width: 145.w,
                  height: 130.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 50.h),
              Center(
                child: Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                'Full Name',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(decoration: InputDecoration(hintText: 'Your Name')),
              SizedBox(height: 20.h),
              Text(
                'Email Address',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(hintText: 'Your Email'),
              ),
              SizedBox(height: 20.h),
              Text(
                'Phone Number',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: 'Phone Number'),
              ),
              SizedBox(height: 20.h),
              Text(
                'Password',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(decoration: InputDecoration(hintText: 'Password')),
              SizedBox(height: 20.h),
              Text(
                'Confirm Password',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(hintText: 'Confirm Password'),
              ),

              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      locationScreen,
                      arguments: {
                        'onSuccess': () => Navigator.pushNamedAndRemoveUntil(
                          navigatorKey.currentContext!,
                          congratulationsScreen,
                          (_) => false,
                        ),
                      },
                      (_) => false,
                    );
                  },
                  child: Text('Next'),
                ),
              ),
              SizedBox(height: 24.h),
              SvgPicture.asset(
                SvgAssets.or,
                // width: double.infinity,
                // height: 24.h,
              ),
              SizedBox(height: 24.h),
              SocialButton(
                text: 'Continue with Google',
                iconPath: SvgAssets.google,
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              SocialButton(
                text: 'Continue with Facebook',
                iconPath: SvgAssets.facebook,
                onPressed: () {},
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ?',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, loginScreen);
                    },
                    child: Text(
                      ' Sign In',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
