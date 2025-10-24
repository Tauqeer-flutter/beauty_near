import 'package:auto_size_text/auto_size_text.dart';
import 'package:beauty_near/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/color_constant.dart';
import '../utils/v_notched_shape.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.15.h),
        child: BottomAppBar(
          height: 80.h,
          color: Colors.white,
          padding: EdgeInsets.zero,
          elevation: 1,
          surfaceTintColor: Colors.transparent,
          // shadowColor: Colors.transparent,
          shadowColor: AppColors.darkGreyColor,
          shape: VNotchedShape(),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 11.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem(
                  label: context.localization.home,
                  index: 0,
                  icon: Iconsax.home,
                  activeIcon: Iconsax.home_15,
                ),
                _buildNavItem(
                  icon: Iconsax.calendar_tick,
                  activeIcon: Iconsax.calendar_tick5,
                  label: context.localization.bookings,
                  index: 1,
                ),
                SizedBox(width: 50.h),
                _buildNavItem(
                  icon: Iconsax.notification_bing,
                  activeIcon: Iconsax.notification_bing5,
                  label: context.localization.alerts,
                  index: 2,
                ),
                _buildNavItem(
                  label: context.localization.settings,
                  index: 3,
                  icon: Iconsax.setting,
                  activeIcon: Iconsax.setting5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          height: 80.h,
          // width: 65.w,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: index == 3 && isSelected ? 20.w : 0,
                ),
                child: Icon(
                  isSelected ? activeIcon : icon,
                  color: isSelected
                      ? AppColors.kPrimaryColor
                      : AppColors.greyColor,
                  size: 24.h,
                ),
              ),
              if (isSelected) ...{
                SizedBox(height: 2.h),
                AutoSizeText(
                  label,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  style: TextStyle(
                    // height: 1.6.h,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
