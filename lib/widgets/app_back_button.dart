import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: MaterialLocalizations.of(context).backButtonTooltip,
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          Navigator.pop(context);
        },
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffFFFFFF),
          ),
          child: SizedBox(
            width: 36.w,
            height: 36.h,
            child: Icon(
              Icons.chevron_left,
              color: Color(0xff292D32),
              size: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
