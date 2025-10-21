import 'package:beauty_near/utils/extensions.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../widgets/language_app_bar.dart';
import '../widgets/social_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? _selectedEthnicity;

  final List<String> _ethnicities = [
    'White',
    'Black/African/Caribbean',
    'Asian',
    'Others',
  ];

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
                  context.localization.createAnAccount,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                context.localization.fullName,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: context.localization.yourName,
                ),
              ),
              SizedBox(height: 20.h),
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
                'Select Ethnicity',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              DropdownButtonFormField2<String>(
                decoration: InputDecoration(
                  // labelText: 'Select Ethnicity',
                  border: OutlineInputBorder(),
                ),
                value: _selectedEthnicity,
                isExpanded: true,
                hint: Text('Select Ethnicity'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedEthnicity = newValue;
                  });
                },
                items: _ethnicities.map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.h),
              Text(
                context.localization.phoneNumber,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: context.localization.phoneNumber,
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
              SizedBox(height: 20.h),
              Text(
                context.localization.confirmPassword,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: context.localization.confirmPassword,
                ),
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
                  child: Text(context.localization.next),
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: SvgPicture.asset(
                  SvgAssets.or,
                  // width: double.infinity,
                  // height: 24.h,
                ),
              ),
              SizedBox(height: 24.h),
              SocialButton(
                text: context.localization.continueWithGoogle,
                iconPath: SvgAssets.google,
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              SocialButton(
                text: context.localization.continueWithFacebook,
                iconPath: SvgAssets.facebook,
                onPressed: () {},
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 2.5.w,
                children: [
                  Text(
                    context.localization.alreadyHaveAccount,
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
                      context.localization.login,
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
