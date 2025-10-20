import 'package:beauty_near/utils/color_constant.dart';
import 'package:beauty_near/view_models/language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageViewModel>(
      builder: (context, languageViewModel, _) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70.r),
              border: Border.all(color: Colors.grey.shade400, width: 1.0),
            ),
            child: PopupMenuButton<String>(
              color: AppColors.kScaffoldColor,
              offset: Offset(8.w, 30.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LanguageViewModel.availableLanguages.firstWhere(
                      (lang) =>
                          lang['code'] ==
                          languageViewModel.currentLocale.languageCode,
                    )['flag']!,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    LanguageViewModel.availableLanguages.firstWhere(
                      (lang) =>
                          lang['code'] ==
                          languageViewModel.currentLocale.languageCode,
                    )['name']!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                ],
              ),
              itemBuilder: (BuildContext context) {
                return LanguageViewModel.availableLanguages.map((language) {
                  return PopupMenuItem<String>(
                    value: language['code']!,
                    child: SizedBox(
                      child: Row(
                        children: [
                          Text(
                            language['flag']!,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.textPrimaryColor,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            language['fullName']!,
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
