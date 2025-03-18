import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class AppTheme {
  final AppColors colors;

  AppTheme(this.colors);

  static ThemeData get lightTheme => AppTheme(AppColors.light()).themeData;
  static ThemeData get darkTheme => AppTheme(AppColors.dark()).themeData;


  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      brightness: colors.background == AppColors.dark().background
          ? Brightness.dark
          : Brightness.light,
      colorScheme: ColorScheme(
        brightness: colors.background == AppColors.dark().background
            ? Brightness.dark
            : Brightness.light,
        primary: colors.primary,
        onPrimary: colors.primary,
        secondary: colors.secondary,
        onSecondary: colors.secondary,
        background: colors.background,
        onBackground: colors.textPrimary,
        surface: colors.background,
        onSurface: colors.textPrimary,
        error: colors.error,
        onError: Colors.white,
        
      ),
      scaffoldBackgroundColor: colors.background,
      chipTheme: AppChipStyles.chipTheme(colors),
      textTheme: AppTextStyles.textTheme(colors),
      inputDecorationTheme: AppInputStyles.inputDecorationTheme(colors),
      sliderTheme: AppInputStyles.sliderTheme(colors),
      checkboxTheme: AppInputStyles.checkboxTheme(colors),
      switchTheme: AppInputStyles.switchTheme(colors),
      radioTheme: AppInputStyles.radioTheme(colors),
      cardTheme: AppCardStyles.cardTheme(colors),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.primary,
        titleTextStyle: AppTextStyles.textTheme(colors).displayMedium!.copyWith(color: Colors.white),
        elevation: 4,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.secondary,
        contentTextStyle: AppTextStyles.textTheme(colors).bodyLarge!.copyWith(color: Colors.white),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: AppTextStyles.textTheme(colors).displayMedium,
        contentTextStyle: AppTextStyles.textTheme(colors).bodyLarge,
      ),
      elevatedButtonTheme: AppButtonStyles.elevatedButtonTheme(colors),
      outlinedButtonTheme: AppButtonStyles.outlinedButtonTheme(colors),
      textButtonTheme: AppButtonStyles.textButtonTheme(colors),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: AppTextStyles.textTheme(colors).bodyLarge!.copyWith(color: Colors.white),
      ),
    );
  }
}
