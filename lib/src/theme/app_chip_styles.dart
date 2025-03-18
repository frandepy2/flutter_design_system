import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppChipStyles {
  static ChipThemeData chipTheme(AppColors colors) {
    return ChipThemeData(
      backgroundColor: colors.primary,
      selectedColor: colors.primaryVariant,
      disabledColor: colors.secondaryLight,
      labelStyle: TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
