import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:design_system/design_system.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  AppColors? _lightCustomColors;
  AppColors? _darkCustomColors;

  ThemeProvider() {
    _lightCustomColors = null;
    _darkCustomColors = null;
  }

  ThemeMode get themeMode => _themeMode;

  AppColors get customColors {
    if (_themeMode == ThemeMode.dark) {
      return _darkCustomColors ?? AppColors.dark();
    } else {
      return _lightCustomColors ?? AppColors.light();
    }
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
    notifyListeners();
  }

  /// 🖌 Aplicar colores personalizados (opcionales)
  void setCustomColors({AppColors? lightColors, AppColors? darkColors}) {
    if (lightColors != null) {
      _lightCustomColors = lightColors;
    }
    if (darkColors != null) {
      _darkCustomColors = darkColors;
    }
    notifyListeners();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    bool? isDark = prefs.getBool('isDarkMode');
    _themeMode = (isDark != null && isDark) ? ThemeMode.dark : ThemeMode.light;

    _lightCustomColors = null;
    _darkCustomColors = null;

    notifyListeners();
  }

  void resetColors() {
    _lightCustomColors = null;
    _darkCustomColors = null;
    notifyListeners();
  }
}
