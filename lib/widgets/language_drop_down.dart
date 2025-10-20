import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../utils/color_constant.dart';
import '../view_models/language_view_model.dart';


class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageViewModel>(
      builder: (context, languageViewModel, _) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SizedBox(
            height: 40.h,
            child: PopupMenuButton<String>(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(70.r),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              color: AppColors.kScaffoldColor,
              offset: Offset(8.w, 40.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(70.r),
                  border: Border.all(color: Colors.grey.shade400, width: 1.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      languageViewModel.currentLocale.svg,
                      width: 24.w,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      languageViewModel.currentLocale.languageCode
                          .toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              itemBuilder: (BuildContext context) {
                return AppLocalizations.supportedLocales.map((language) {
                  return PopupMenuItem<String>(
                    value: language.languageCode,
                    child: SizedBox(
                      child: Row(
                        children: [
                          SvgPicture.asset(language.svg, width: 24.w),
                          SizedBox(width: 8.w),
                          Text(
                            language.name,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList();
              },
              onSelected: (String newValue) {
                languageViewModel.changeLocale(Locale(newValue));
              },
            ),
          ),
        );
      },
    );
  }
}
