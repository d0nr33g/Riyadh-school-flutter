import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riyad/core/app_colors.dart';

class AppTheme {
  static String fontFamily = "SF-Pro-Text";
  static TextTheme latoTheme = TextTheme(
    bodySmall: TextStyle(fontSize: 10.sp, fontFamily: fontFamily),
    labelSmall: TextStyle(fontSize: 12.sp, fontFamily: fontFamily),
    bodyLarge: TextStyle(fontSize: 14.sp, fontFamily: fontFamily),
    bodyMedium: TextStyle(fontSize: 16.sp, fontFamily: fontFamily),
    displayLarge: TextStyle(fontSize: 38.sp, fontFamily: fontFamily),
    displayMedium: TextStyle(fontSize: 28.sp, fontFamily: fontFamily),
    displaySmall: TextStyle(fontSize: 18.sp, fontFamily: fontFamily),
    labelLarge: TextStyle(fontSize: 20.sp, fontFamily: fontFamily),
    titleMedium: TextStyle(fontSize: 13.sp, fontFamily: fontFamily),
    titleSmall: TextStyle(fontSize: 15.sp, fontFamily: fontFamily),
  );

  static ThemeData light() {
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.primaryColor,
        textTheme: latoTheme,
        fontFamily: fontFamily);
  }
}
