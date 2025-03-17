import 'package:flutter/material.dart';

class AppColors {
  // 🎨 Paleta de colores dinámicos
  final Color primary;
  final Color primaryVariant;
  final Color primaryLight;

  final Color secondary;
  final Color secondaryVariant;
  final Color secondaryLight;

  final Color tertiary;
  final Color tertiaryVariant;
  final Color tertiaryLight;

  final Color background;
  final Color textPrimary;
  final Color buttonText;

  final Color error;
  final Color success;

  // Constructor con valores predeterminados
  const AppColors({
    required this.primary,
    required this.primaryVariant,
    required this.primaryLight,
    required this.secondary,
    required this.secondaryVariant,
    required this.secondaryLight,
    required this.tertiary,
    required this.tertiaryVariant,
    required this.tertiaryLight,
    required this.background,
    required this.textPrimary,
    required this.buttonText,
    required this.error,
    required this.success,
  });

  // 🎯 Método para obtener una versión Light
  factory AppColors.light() => const AppColors(
        primary: Color(0xFF6750A4),
        primaryVariant: Color(0xFF4F378B),
        primaryLight: Color(0xFFD0BCFF),
        secondary: Color(0xFF625B71),
        secondaryVariant: Color(0xFF4A4458),
        secondaryLight: Color(0xFFCCC2DC),
        tertiary: Color(0xFF7D5260),
        tertiaryVariant: Color(0xFF633B48),
        tertiaryLight: Color(0xFFEFB8C8),
        background: Color(0xFFF5F5F5),
        textPrimary: Color(0xFF1D1B20),
        buttonText: Color(0xFFE6E1E5),
        error: Color(0xFFB3261E),
        success: Color(0xFF388E3C),
      );

  // 🌙 Método para obtener una versión Dark
  factory AppColors.dark() => const AppColors(
        primary: Color(0xFFBB86FC),
        primaryVariant: Color(0xFF3700B3),
        primaryLight: Color(0xFFCE93D8),
        secondary: Color(0xFF03DAC6),
        secondaryVariant: Color(0xFF018786),
        secondaryLight: Color(0xFFB2DFDB),
        tertiary: Color(0xFFCF6679),
        tertiaryVariant: Color(0xFFB00020),
        tertiaryLight: Color(0xFFF48FB1),
        background: Color(0xFF1C1B1F),
        textPrimary: Color(0xFFE6E1E5),
        buttonText: Color(0xFFE6E1E5),
        error: Color(0xFFCF6679),
        success: Color(0xFF03DAC6),
      );

  // 🌗 Método para obtener una versión basada en ThemeMode
  factory AppColors.fromBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? AppColors.dark() : AppColors.light();
  }
}
