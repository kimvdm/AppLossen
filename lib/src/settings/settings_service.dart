import 'package:applossen/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  Future<ThemeMode> themeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int themeIndex =
        prefs.getInt(SharedPreferencesKeys.themeMode) ?? ThemeMode.system.index;
    return ThemeMode.values[themeIndex];
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(SharedPreferencesKeys.themeMode, theme.index);
  }
}
