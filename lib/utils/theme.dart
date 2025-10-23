import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constant.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.kPrimaryColor,
        brightness: Brightness.light,
      ),
    ).copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.kScaffoldColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.kScaffoldColor,
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
      ),
      textTheme: GoogleFonts.montserratTextTheme(),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.kPrimaryColor,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Colors.white,
        dialHandColor: AppColors.kPrimaryColor,
        dialBackgroundColor: AppColors.greyColor,
        hourMinuteColor: AppColors.greyColor,
        dayPeriodColor: AppColors.kPrimaryColor,
        dayPeriodTextColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return AppColors.darkGreyColor;
        }),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.kScaffoldColor,
        todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.kPrimaryColor;
          }
          return AppColors.kScaffoldColor;
        }),
        dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.kPrimaryColor;
          }
          return AppColors.kScaffoldColor;
        }),
      ),
      iconTheme: const IconThemeData(color: Colors.black54),
      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        checkColor: WidgetStatePropertyAll(Colors.white),
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.kPrimaryColor;
          }
          return null;
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 9.h),
          textStyle: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          foregroundColor: Colors.white,
          backgroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48.r),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 9.h),
          textStyle: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          side: BorderSide(color: AppColors.kPrimaryColor, width: 1.sp),
          foregroundColor: AppColors.kPrimaryColor,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48.r),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        filled: true,
        fillColor: Colors.white,
        errorStyle: TextStyle(fontSize: 11.sp, overflow: TextOverflow.visible),
        errorMaxLines: 2,

        hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.greyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(38.r),
          borderSide: BorderSide(color: AppColors.strokeColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(38.r),
          borderSide: BorderSide(color: AppColors.strokeColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(38.r),
          borderSide: BorderSide(color: AppColors.strokeColor),
        ),
      ),
    );
  }

  // Dark Theme
  // static ThemeData get darkTheme {
  //   return ThemeData.from(
  //     colorScheme: ColorScheme.fromSeed(
  //       seedColor: AppColors.kPrimaryColor,
  //       brightness: Brightness.light,
  //     ),
  //   ).copyWith(
  //     brightness: Brightness.light,
  //
  //     // primaryColor: AppColors.kPrimaryColor,
  //     scaffoldBackgroundColor: AppColors.kScaffoldColor,
  //     appBarTheme: AppBarTheme(
  //       backgroundColor: AppColors.kScaffoldColor,
  //       foregroundColor: Colors.white,
  //       titleTextStyle: GoogleFonts.montserrat(
  //         textStyle: TextStyle(
  //           color: AppColors.textPrimaryColor,
  //           fontSize: 19.sp,
  //           fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //       elevation: 0,
  //       // centerTitle: true,
  //     ),
  //     textTheme: GoogleFonts.montserratTextTheme(),
  //     // Text Selection Theme for cursor color
  //     textSelectionTheme: TextSelectionThemeData(
  //       cursorColor: AppColors.kPrimaryColor, // Cursor color
  //     ),
  //     timePickerTheme: TimePickerThemeData(backgroundColor: Colors.white),
  //     iconTheme: const IconThemeData(color: Colors.black54),
  //     checkboxTheme: CheckboxThemeData(
  //       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //       visualDensity: VisualDensity.compact,
  //       checkColor: WidgetStatePropertyAll(Colors.white),
  //       fillColor: WidgetStateProperty.resolveWith<Color?>((
  //         Set<WidgetState> states,
  //       ) {
  //         if (states.contains(WidgetState.selected)) {
  //           return AppColors.kPrimaryColor;
  //         }
  //         return null;
  //       }),
  //     ),
  //
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         padding: EdgeInsets.symmetric(vertical: 13.h),
  //         textStyle: GoogleFonts.montserrat(
  //           textStyle: TextStyle(
  //             color: Colors.white,
  //             fontSize: 16.sp,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //
  //         foregroundColor: Colors.white,
  //         backgroundColor: AppColors.kPrimaryColor,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(48.r),
  //         ),
  //       ),
  //     ),
  //     inputDecorationTheme: InputDecorationTheme(
  //       contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
  //       filled: true,
  //       fillColor: Colors.white,
  //       errorStyle: TextStyle(fontSize: 11.sp, overflow: TextOverflow.visible),
  //       errorMaxLines: 2,
  //
  //       hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.greyColor),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(38.r),
  //         borderSide: BorderSide(color: AppColors.strokeColor),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(38.r),
  //         borderSide: BorderSide(color: AppColors.strokeColor),
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(38.r),
  //         borderSide: BorderSide(color: AppColors.strokeColor),
  //       ),
  //     ),
  //   );
  // }
}
