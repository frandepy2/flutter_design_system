import 'package:flutter/material.dart';

class AppColors {
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

  factory AppColors.light() => const AppColors(
        primary:
            Color(0xFF5E60CE), // Azul-violeta vibrante (antes era muy apagado)
        primaryVariant: Color(0xFF4A44A1), // Tono más oscuro del primary
        primaryLight: Color(0xFFB3B8FF), // Azul-violeta más claro

        secondary: Color(0xFF4A4E69), // Gris azulado elegante
        secondaryVariant: Color(0xFF2D3142), // Versión más oscura
        secondaryLight: Color(0xFFB8C1EC), // Versión más clara

        tertiary: Color(0xFFE07A5F), // Naranja coral para dar calidez
        tertiaryVariant: Color(0xFFC75C47), // Versión más oscura
        tertiaryLight: Color(0xFFF4A261), // Versión más clara

        background: Color(
            0xFFF8F9FA), // Gris muy claro, casi blanco (antes era muy grisáceo)
        textPrimary:
            Color(0xFF22223B), // Azul oscuro, más legible que negro puro
        buttonText:
            Color(0xFFFFFFFF), // Blanco puro para contrastar con los botones

        error: Color(0xFFD90429), // Rojo intenso para errores
        success: Color(0xFF2D6A4F), // Verde oscuro para éxito
      );

  factory AppColors.dark() => const AppColors(
        primary:
            Color(0xFF5E60CE), // Azul-violeta vibrante (antes era muy apagado)
        primaryVariant: Color(0xFF4A44A1), // Tono más oscuro del primary
        primaryLight: Color(0xFFB3B8FF), // Azul-violeta más claro

        secondary: Color(0xFF4A4E69), // Gris azulado (coherente con Light Mode)
        secondaryVariant: Color(0xFF22223B), // Versión más oscura
        secondaryLight: Color(0xFFB8C1EC), // Versión más clara

        tertiary: Color(0xFFEF8354), // Naranja más vibrante en modo oscuro
        tertiaryVariant: Color(0xFFC75C47), // Versión más oscura
        tertiaryLight: Color(0xFFF4A261), // Versión más clara

        background: Color(0xFF121212), // Gris-negro (en lugar de negro puro)
        textPrimary: Color(0xFFF5F5F5), // Blanco humo para no ser tan brillante
        buttonText:
            Color(0xFF000000), // Negro para contrastar en botones claros

        error: Color(0xFFCF6679), // Rojo más suave para Dark Mode
        success: Color(0xFF50FA7B), // Verde neón para mayor visibilidad
      );

  factory AppColors.fromBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? AppColors.dark() : AppColors.light();
  }
}
