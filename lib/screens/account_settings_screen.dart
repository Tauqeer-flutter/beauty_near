import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../route_generator.dart';
import '../utils/assets.dart';
import '../utils/color_constant.dart';
import '../widgets/account_tile.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: 0,
            bottom: MediaQuery.sizeOf(context).height - 178.h,
            child: Container(
              height: 178.h,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.kPrimaryGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.r),
                  bottomRight: Radius.circular(50.r),
                ),
              ),
            ),
          ),
          Positioned(
            top: 68.h,
            child: Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.kScaffoldColor,
              ),
            ),
          ),
          Positioned(
            top: 121.h,
            child: Container(
              height: 108.h,
              width: 108.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(PngAssets.person),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 250.h,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                SizedBox(height: 40.h),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      bottom: context.notchAwareBottomPadding,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'General',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        AccountTile(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              personalInformationScreen,
                            );
                          },
                          title: 'Personal Information',
                          iconPath: SvgAssets.pi,
                        ),
                        SizedBox(height: 10.h),
                        AccountTile(
                          onTap: () {
                            Navigator.pushNamed(context, support);
                          },
                          title: 'Support',
                          iconPath: SvgAssets.support,
                        ),
                        SizedBox(height: 10.h),
                        AccountTile(
                          onTap: () {
                            Navigator.pushNamed(context, languagesScreen);
                          },
                          title: 'Language',
                          iconPath: SvgAssets.lang,
                        ),
                        SizedBox(height: 30.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Help & Support',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        AccountTile(
                          onTap: () {
                            Navigator.pushNamed(context, aboutUs);
                          },
                          title: 'About Us',
                          iconPath: SvgAssets.about,
                        ),
                        SizedBox(height: 10.h),
                        AccountTile(
                          onTap: () {
                            Navigator.pushNamed(context, privacyPolicy);
                          },
                          title: 'Privacy Policy',
                          iconPath: SvgAssets.pp,
                        ),
                        SizedBox(height: 10.h),
                        AccountTile(
                          onTap: () {
                            Navigator.pushNamed(context, termsAndConditions);
                          },
                          title: 'Terms & Conditions',
                          iconPath: SvgAssets.tc,
                        ),
                        SizedBox(height: 30.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        AccountTile(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              loginScreen,
                              (route) => false,
                            );
                          },
                          title: 'Logout',
                          iconPath: SvgAssets.logout,
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
