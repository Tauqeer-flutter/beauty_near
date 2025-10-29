import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../utils/color_constant.dart';
import '../view_models/language_view_model.dart';

class LanguageButton extends StatelessWidget {
  LanguageButton({super.key});

  final controller = MenuController();

  void _onMenuTap() {
    if (controller.isOpen) {
      controller.close();
    } else {
      controller.open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Consumer<LanguageViewModel>(
        builder: (context, languageViewModel, _) {
          return MenuAnchor(
            controller: controller,
            crossAxisUnconstrained: true,
            style: MenuStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            consumeOutsideTap: true,
            builder: (context, controller, child) {
              return SizedBox(
                height: 45.h,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70.r),
                    side: BorderSide(
                      color: AppColors.greyColor.withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: _onMenuTap,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                    ),
                  ),
                ),
              );
            },
            menuChildren: AppLocalizations.supportedLocales.map((language) {
              return InkWell(
                onTap: () {
                  _onMenuTap();
                  context.read<LanguageViewModel>().changeLocale(language);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
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
            }).toList(),
          );
        },
      ),
    );
  }
}
