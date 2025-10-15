import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/color_constant.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Iconsax.search_normal),
        hintText: 'Search',
        hintStyle: TextStyle(color: AppColors.iconColor, fontSize: 16.sp),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24.h,
              width: 2.w,
              child: VerticalDivider(
                thickness: 1.w,
                color: AppColors.iconColor,
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Iconsax.sort)),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }
}
