import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/style/kolors.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      background: AppColors.darkBackgroundColor,
      onBackground: AppColors.gray[100]!
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    appBarTheme: AppBarTheme(color: AppColors.gray[900],)
  );
}