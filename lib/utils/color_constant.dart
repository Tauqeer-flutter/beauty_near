import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimaryColor = Color(0xffD9303C);
  static const Color highlightColor = Color(0xffFFF3EE);
  static const Color kScaffoldColor = Color(0xffFAFAFF);
  static const Color textPrimaryColor = Color(0xff1C1C1C);
  static const Color greyColor = Color(0xffCCCCCC);
  static const Color darkGreyColor = Color(0xff4A4A4A);
  static const Color strokeColor = Color(0xffF3F3F3);
  static const Color kBlackText = Color(0xff000000);
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [kPrimaryColor, Color(0xffDE6C75)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [kPrimaryColor, Color(0xffDE6C75), Colors.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient kPrimaryGradient = LinearGradient(
    colors: [AppColors.kPrimaryColor, Color(0xffDE6C75)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
