import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color_constant.dart';

Future<String> selectDurationDialogBox({required BuildContext screenContext}) async {
  FocusManager.instance.primaryFocus?.unfocus();
  int selectedHours = 0;
  int selectedMinutes = 0;
  String duration = '';
  await showDialog(
    context: screenContext,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(
              'Select Duration',
              style: TextStyle(
                color: AppColors.textPrimaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            content: SizedBox(
              height: 200.h,
              child: Row(
                children: [
                  // Hours picker
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Hours',
                          style: TextStyle(
                            color: AppColors.textPrimaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: ListWheelScrollView(
                            itemExtent: 40.h,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                selectedHours = index;
                              });
                            },
                            children: List.generate(25, (index) {
                              return Center(
                                child: Text(
                                  index.toString().padLeft(2, '0'),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: selectedHours == index
                                        ? AppColors.kPrimaryColor
                                        : AppColors.textPrimaryColor,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                  // Minutes picker
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Minutes',
                          style: TextStyle(
                            color: AppColors.textPrimaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: ListWheelScrollView(
                            itemExtent: 40.h,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                selectedMinutes = index * 5; // 0, 5, 10, 15, etc.
                              });
                            },
                            children: List.generate(12, (index) {
                              int minutes = index * 5;
                              return Center(
                                child: Text(
                                  minutes.toString().padLeft(2, '0'),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: selectedMinutes == minutes
                                        ? AppColors.kPrimaryColor
                                        : AppColors.textPrimaryColor,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: AppColors.darkGreyColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    duration = '${selectedHours.toString().padLeft(2, '0')}:${selectedMinutes.toString().padLeft(2, '0')}';
                  });
                  Navigator.of(context).pop();
                  Future.delayed(Duration(milliseconds: 100), () {
                    FocusScope.of(context).unfocus();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ],
          );
        },
      );
    },
  );
  return duration;
}
