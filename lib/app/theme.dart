import 'package:flutter/material.dart';
import 'package:flutter_graphql_poc/app/config.dart';

abstract class AppTheme {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.portalDark,
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFD9FF9A),
    onPrimaryContainer: AppColors.ink,
    secondary: Color(0xFF006A67),
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFA7FFFB),
    onSecondaryContainer: Color(0xFF00201F),
    tertiary: Color(0xFF805600),
    onTertiary: Colors.white,
    error: Color(0xFFBA1A1A),
    onError: Colors.white,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightText,
    onSurfaceVariant: AppColors.lightTextMuted,
    outline: Color(0xFF747C68),
    outlineVariant: Color(0xFFC4CBB8),
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: AppColors.deepSpace,
    onInverseSurface: AppColors.text,
    inversePrimary: AppColors.portal,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.portal,
    onPrimary: AppColors.ink,
    primaryContainer: AppColors.portalDark,
    onPrimaryContainer: Color(0xFFD9FF9A),
    secondary: AppColors.plasma,
    onSecondary: Color(0xFF00201F),
    secondaryContainer: Color(0xFF074A4A),
    onSecondaryContainer: Color(0xFFA7FFFB),
    tertiary: AppColors.warning,
    onTertiary: Color(0xFF2A1900),
    error: AppColors.danger,
    onError: Color(0xFF3B050A),
    surface: AppColors.deepSpace,
    onSurface: AppColors.text,
    onSurfaceVariant: AppColors.textMuted,
    outline: Color(0xFF4B566E),
    outlineVariant: Color(0xFF29334A),
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: AppColors.text,
    onInverseSurface: AppColors.deepSpace,
    inversePrimary: Color(0xFF477B00),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: AppColors.lightBackground,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      scaffoldBackgroundColor: AppColors.space,
    );
  }
}
