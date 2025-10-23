import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';

class BarberTitleDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 0.0;

  @override
  double get maxExtent => 60.h;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double opacity = (1.0 - (shrinkOffset / maxExtent)).clamp(0.0, 1.0);

    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 20.w),
        child: Text(
          'Barber Name Here',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.kBlackText,
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(BarberTitleDelegate oldDelegate) => false;
}
