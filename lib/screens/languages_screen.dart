import 'package:beauty_near/l10n/app_localizations.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:beauty_near/view_models/language_view_model.dart';
import 'package:beauty_near/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../utils/color_constant.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LanguageViewModel>().currentLocale;
    ();
    return Scaffold(
      appBar: CustomAppBar(title: context.localization.languages),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              context.localization.selectLanguage,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimaryColor,
              ),
            ),
            SizedBox(height: 10.h),
            _buildCurrentLanguageView(currentLocale),
            SizedBox(height: 40.h),
            Text(
              context.localization.allLanguages,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimaryColor,
              ),
            ),
            SizedBox(height: 10.h),
            for (final locale in AppLocalizations.supportedLocales)
              if (locale.languageCode == currentLocale.languageCode)
                SizedBox()
              else
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: _buildLanguageCard(context, locale),
                ),
          ],
        ),
      ),
    );
  }

  Container _buildCurrentLanguageView(Locale currentLocale) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        gradient: AppColors.kPrimaryGradient,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SvgPicture.asset(
              currentLocale.svg,
              width: 32.w,
              height: 20,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            currentLocale.name,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Spacer(),
          SizedBox(
            width: 18.w,
            height: 18.h,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
              value: true,
              onChanged: (value) {},
              activeColor: Colors.white,
              checkColor: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildLanguageCard(BuildContext context, Locale locale) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () => context.read<LanguageViewModel>().changeLocale(locale),
        behavior: HitTestBehavior.opaque,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Color(0xffEFC2C8),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(
                locale.svg,
                width: 32.w,
                height: 20,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              locale.name,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimaryColor,
              ),
            ),
            Spacer(),
            SizedBox(
              width: 18.w,
              height: 18.h,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                value: false,
                onChanged: (value) {},
                activeColor: AppColors.textPrimaryColor,
                checkColor: AppColors.kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
