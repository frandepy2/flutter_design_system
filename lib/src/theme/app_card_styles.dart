import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppCardStyles {
  static CardTheme cardTheme(AppColors colors) {
    return CardTheme(
      color: colors.background, // Usa el color de fondo dinámico
      shadowColor: colors.textPrimary.withOpacity(colors.background == AppColors.dark().background ? 0.2 : 0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
