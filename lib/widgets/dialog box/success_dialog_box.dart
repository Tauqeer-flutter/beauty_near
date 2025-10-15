import 'package:beauty_near/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSuccessDialog({
  required BuildContext screenContext,
  required String desc,
  required Function onSuccess,
}) {
  showDialog(
    context: screenContext,
    barrierDismissible: true,
    builder: (BuildContext context) {
      // Auto close after 3 seconds
      Future.delayed(Duration(seconds: 2), () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          onSuccess();
        }
      });

      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 313.h,
          width: 343.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Outer circle with red color and alpha 0.2
              Container(
                height: 91.h,
                width: 91.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kPrimaryColor.withOpacity(0.2),
                ),
                child: Center(
                  // Inner circle with red color
                  child: Container(
                    height: 61.h,
                    width: 61.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColors.kPrimaryGradient,
                    ),
                    child: Icon(Icons.check, color: Colors.white, size: 34),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              // Text
              Text(
                desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
