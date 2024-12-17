import 'package:applossen/src/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeDataSource {
  Future<ThemeMode> themeMode();
  updateThemeMode(ThemeMode theme);
}

//TODO: Check if sharePref can be a late init variable without causing crash
class ThemeDataSourceImpl implements ThemeDataSource {
  @override
  Future<ThemeMode> themeMode() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    int themeIndex = sharedPrefs.getInt(SharedPreferencesKeys.themeMode) ??
        ThemeMode.system.index;
    return ThemeMode.values[themeIndex];
  }

  @override
  updateThemeMode(ThemeMode theme) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.setInt(SharedPreferencesKeys.themeMode, theme.index);
  }
}
