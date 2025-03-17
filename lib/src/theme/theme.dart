import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData createTheme(AppColors colors) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: colors.background == AppColors.dark().background
          ? Brightness.dark
          : Brightness.light,
      primary: colors.primary,
      onPrimary: Colors.white,
      secondary: colors.secondary,
      onSecondary: Colors.white,
      background: colors.background,
      onBackground: colors.textPrimary,
      surface: colors.background,
      onSurface: colors.textPrimary,
      error: colors.error,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: colors.background,
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: colors.textPrimary),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: colors.textPrimary),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colors.buttonText),
    ),
  );
}