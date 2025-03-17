import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:design_system/design_system.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  AppColors _customColors = AppColors.light();

  ThemeMode get themeMode => _themeMode;
  AppColors get customColors => _customColors;

  /// Cambiar entre Light y Dark Mode y guardarlo
  Future<void> toggleTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    await prefs.setBool('isDarkMode', isDarkMode);
    notifyListeners();
  }

  /// Guardar `AppColors` en `SharedPreferences`
  Future<void> setCustomColors(AppColors colors) async {
    final prefs = await SharedPreferences.getInstance();
    _customColors = colors;

    // Guardar cada propiedad de AppColors en SharedPreferences
    await prefs.setInt('primary', colors.primary.value);
    await prefs.setInt('primaryVariant', colors.primaryVariant.value);
    await prefs.setInt('primaryLight', colors.primaryLight.value);
    await prefs.setInt('secondary', colors.secondary.value);
    await prefs.setInt('secondaryVariant', colors.secondaryVariant.value);
    await prefs.setInt('secondaryLight', colors.secondaryLight.value);
    await prefs.setInt('tertiary', colors.tertiary.value);
    await prefs.setInt('tertiaryVariant', colors.tertiaryVariant.value);
    await prefs.setInt('tertiaryLight', colors.tertiaryLight.value);
    await prefs.setInt('background', colors.background.value);
    await prefs.setInt('textPrimary', colors.textPrimary.value);
    await prefs.setInt('buttonText', colors.buttonText.value);
    await prefs.setInt('error', colors.error.value);
    await prefs.setInt('success', colors.success.value);

    notifyListeners();
  }

  /// Cargar `ThemeMode` y `AppColors` desde `SharedPreferences`
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    // Cargar ThemeMode
    bool? isDark = prefs.getBool('isDarkMode');
    _themeMode = (isDark != null && isDark) ? ThemeMode.dark : ThemeMode.light;

    // Cargar colores guardados, si no hay valores usa `AppColors.light()`
    _customColors = AppColors(
      primary: Color(prefs.getInt('primary') ?? AppColors.light().primary.value),
      primaryVariant: Color(prefs.getInt('primaryVariant') ?? AppColors.light().primaryVariant.value),
      primaryLight: Color(prefs.getInt('primaryLight') ?? AppColors.light().primaryLight.value),
      secondary: Color(prefs.getInt('secondary') ?? AppColors.light().secondary.value),
      secondaryVariant: Color(prefs.getInt('secondaryVariant') ?? AppColors.light().secondaryVariant.value),
      secondaryLight: Color(prefs.getInt('secondaryLight') ?? AppColors.light().secondaryLight.value),
      tertiary: Color(prefs.getInt('tertiary') ?? AppColors.light().tertiary.value),
      tertiaryVariant: Color(prefs.getInt('tertiaryVariant') ?? AppColors.light().tertiaryVariant.value),
      tertiaryLight: Color(prefs.getInt('tertiaryLight') ?? AppColors.light().tertiaryLight.value),
      background: Color(prefs.getInt('background') ?? AppColors.light().background.value),
      textPrimary: Color(prefs.getInt('textPrimary') ?? AppColors.light().textPrimary.value),
      buttonText: Color(prefs.getInt('buttonText') ?? AppColors.light().buttonText.value),
      error: Color(prefs.getInt('error') ?? AppColors.light().error.value),
      success: Color(prefs.getInt('success') ?? AppColors.light().success.value),
    );

    notifyListeners();
  }
}