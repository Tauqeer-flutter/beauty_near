import 'package:beauty_near/screens/bot_nav_bar_page.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../widgets/language_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LanguageAppBar(),
      extendBodyBehindAppBar: true,
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
                  context.localization.loginToYourAccount,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              // _buildUserTypeSelector(),
              // SizedBox(height: 32.h),
              Text(
                context.localization.emailAddress,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: context.localization.yourEmail,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                context.localization.password,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: context.localization.password,
                ),
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  context.localization.forgotPassword,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      BotNavPage.routeName,
                      (_) => false,
                    );
                  },
                  child: Text(context.localization.login),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.localization.dontHavAccount,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.darkGreyColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, signupScreen);
                },
                child: Text(
                  context.localization.signUp,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
