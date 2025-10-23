import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_constant.dart';

class BarberTitleDelegate extends SliverPersistentHeaderDelegate {
  final double opacity;

  const BarberTitleDelegate({required this.opacity});
  @override
  double get minExtent => 0.0;

  @override
  double get maxExtent {
    // if (opacity >= 0.87) {
    //   return 0.h;
    // }
    return 60.h;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final adjustedOpacity = 1 - opacity;
    return AnimatedOpacity(
      opacity: adjustedOpacity > 0.8 ? 1 : adjustedOpacity,
      duration: Duration(milliseconds: 250),
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
  bool shouldRebuild(BarberTitleDelegate oldDelegate) =>
      oldDelegate.opacity != opacity;
}
