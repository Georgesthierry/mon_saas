import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/style/kolors.dart';
import 'app_size.dart';

class AppTheme {
  final String fontFamily;

  AppTheme({required this.fontFamily});

  /// ---------------- DARK THEME ----------------
  ThemeData get dark {
    return _getThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryColor,
        background: AppColors.darkBackgroundColor,
        surface: AppColors.gray[800]!,
      ),
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.gray[900]!.withOpacity(0.3),
      ), elevatedButtonTextStyle: _darkElevatedButtonTextStyle, outlinedButtonTextStyle: _lightElevatedButtonTextStyle,
    );
  }

  /// ---------------- LIGHT THEME ----------------
  ThemeData get light {
    return _getThemeData(
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        background: AppColors.gray[100]!,
      ),
      scaffoldBackgroundColor: AppColors.gray[100]!,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.gray[100],
      ), elevatedButtonTextStyle: _darkElevatedButtonTextStyle, outlinedButtonTextStyle: _lightElevatedButtonTextStyle,
    );
  }

  /// ---------------- COMMON THEME BUILDER ----------------
  ThemeData _getThemeData({
    required ColorScheme colorScheme,
    required WidgetStatePropertyAll<TextStyle>elevatedButtonTextStyle,
    required WidgetStatePropertyAll<TextStyle>outlinedButtonTextStyle,
    required Color scaffoldBackgroundColor,
    required AppBarTheme appBarTheme,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: appBarTheme,

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(40),
          padding: EdgeInsets.symmetric(
            horizontal: Insets.xs,
            vertical: 10,
          ),
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
  final _primaryButtonStates = WidgetStateProperty.resolveWith((state){
    if (state.contains(WidgetState.hovered)|| state.contains(WidgetState.pressed)){
      return Color(0xff561895).withOpacity(0.7);
    }
    return AppColors.primaryColor;
  });
  final _outlineButtonStates = WidgetStateProperty.resolveWith((state){
    if (state.contains(WidgetState.hovered)|| state.contains(WidgetState.pressed)){
      return BorderSide(color: Color(0xff561895).withOpacity(0.7));
    }
    return BorderSide(color: Color(0xff561895));
  });
  WidgetStatePropertyAll<TextStyle> get _darkElevatedButtonTextStyle =>
      WidgetStatePropertyAll(TextStyle(
        color: AppColors.gray[100],
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500
      ));
  WidgetStatePropertyAll<TextStyle> get _lightElevatedButtonTextStyle =>
      WidgetStatePropertyAll(TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500
      ));
}
