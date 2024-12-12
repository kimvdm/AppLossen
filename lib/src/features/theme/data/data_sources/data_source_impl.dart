import 'package:applossen/src/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeDataSource {
  ThemeMode themeMode();
  updateThemeMode(ThemeMode theme);
}

class ThemeDataSourceImpl implements ThemeDataSource {
  late final SharedPreferences _sharedPrefs;

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  @override
  ThemeMode themeMode() {
    int themeIndex = _sharedPrefs.getInt(SharedPreferencesKeys.themeMode) ??
        ThemeMode.system.index;
    return ThemeMode.values[themeIndex];
  }

  @override
  updateThemeMode(ThemeMode theme) {
    return _sharedPrefs.setInt(SharedPreferencesKeys.themeMode, theme.index);
  }
}
