import 'package:flutter/material.dart';
import 'package:news_app/utils/app_styles.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    indicatorColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16Black,
      labelMedium: AppStyles.medium14Black,
      headlineMedium: AppStyles.medium24Black,
      headlineLarge: AppStyles.medium20Black,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    indicatorColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16White,
      labelMedium: AppStyles.medium14White,
      headlineMedium: AppStyles.medium24White,
      headlineLarge: AppStyles.medium20White,
    ),
  );
}
extension CustomTheme on ThemeData {
  Color get viewButtonBg => brightness == Brightness.dark
      ? AppColors.whiteColor
      : AppColors.blackColor;

  Color get viewButtonText => brightness == Brightness.dark
      ? AppColors.blackColor
      : AppColors.whiteColor;
}
