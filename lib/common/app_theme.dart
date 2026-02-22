import 'package:flutter/material.dart';
import 'package:islamy/common/app_colors.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.goldColor),
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.goldColor),
      titleTextStyle: TextStyle(
        color: AppColors.goldColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.goldColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      elevation: 0,

      selectedItemColor: Colors.white,
      unselectedItemColor: AppColors.blackColor,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
