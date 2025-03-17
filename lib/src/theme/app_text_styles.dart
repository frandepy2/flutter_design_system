import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextTheme textTheme(AppColors colors) {
    return TextTheme(
      displayLarge: GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: colors.textPrimary,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: colors.secondary,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: colors.textPrimary,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: colors.buttonText,
      ),
    );
  }
}
