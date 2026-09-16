import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF315C00),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFD9FF9A),
    onPrimaryContainer: Color(0xFF101508),
    secondary: Color(0xFF006A67),
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFA7FFFB),
    onSecondaryContainer: Color(0xFF00201F),
    tertiary: Color(0xFF805600),
    onTertiary: Colors.white,
    error: Color(0xFFBA1A1A),
    onError: Colors.white,
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF18210F),
    onSurfaceVariant: Color(0xFF59634C),
    outline: Color(0xFF747C68),
    outlineVariant: Color(0xFFC4CBB8),
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: Color(0xFF0D1324),
    onInverseSurface: Color(0xFFF4F7EE),
    inversePrimary: Color(0xFFB8F34A),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFB8F34A),
    onPrimary: Color(0xFF101508),
    primaryContainer: Color(0xFF315C00),
    onPrimaryContainer: Color(0xFFD9FF9A),
    secondary: Color(0xFF61E7E2),
    onSecondary: Color(0xFF00201F),
    secondaryContainer: Color(0xFF074A4A),
    onSecondaryContainer: Color(0xFFA7FFFB),
    tertiary: Color(0xFFFFC857),
    onTertiary: Color(0xFF2A1900),
    error: Color(0xFFFF6B75),
    onError: Color(0xFF3B050A),
    surface: Color(0xFF0D1324),
    onSurface: Color(0xFFF4F7EE),
    onSurfaceVariant: Color(0xFFAAB4C8),
    outline: Color(0xFF4B566E),
    outlineVariant: Color(0xFF29334A),
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: Color(0xFFF4F7EE),
    onInverseSurface: Color(0xFF0D1324),
    inversePrimary: Color(0xFF477B00),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: Color(0xFFF7FAF2),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      scaffoldBackgroundColor: Color(0xFF070B16),
    );
  }
}
