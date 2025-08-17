import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.kWightBase,
    fontFamily: "Inter",
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.mainColor,
      secondary: AppColors.kWightBase,
      onSecondary: AppColors.kBlack,
      shadow: AppColors.kGray,
      surface: AppColors.mainColor,
      primaryContainer: AppColors.error,
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.kBlack,
      ),
      labelMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.kBlack,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.kWhiteBase,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.mainColor,
      ),
      bodySmall: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.kBlack,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.error,
      ),
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.kBaseColor,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.kBlack,
      ),
      centerTitle: false,
      surfaceTintColor: AppColors.kBlack,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.mainColor,
      selectionHandleColor: AppColors.mainColor,
      selectionColor: AppColors.mainColor.withValues(alpha: 0.2),
    ),
  );
}
