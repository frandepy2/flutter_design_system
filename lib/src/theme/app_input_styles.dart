import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppInputStyles {
  static InputDecorationTheme inputDecorationTheme(AppColors colors) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colors.background,
      hintStyle: AppTextStyles.textTheme(colors).headlineSmall,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colors.secondary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colors.primary, width: 2),
      ),
    );
  }

  static SliderThemeData sliderTheme(AppColors colors) {
    return SliderThemeData(
      activeTrackColor: colors.primary,
      inactiveTrackColor: colors.secondaryLight,
      thumbColor: colors.primary,
      overlayColor: colors.primary.withOpacity(0.2),
    );
  }

  static CheckboxThemeData checkboxTheme(AppColors colors) {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return colors.primary;
        }
        return colors.secondaryLight;
      }),
      checkColor: MaterialStateProperty.all(Colors.white),
    );
  }

  static SwitchThemeData switchTheme(AppColors colors) {
    return SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        return colors.primary;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return colors.primary.withOpacity(0.5);
        }
        return colors.secondaryLight;
      }),
    );
  }

  static RadioThemeData radioTheme(AppColors colors) {
    return RadioThemeData(
      fillColor: MaterialStateProperty.all(colors.primary),
    );
  }
}
