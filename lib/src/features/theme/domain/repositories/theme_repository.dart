import 'package:flutter/material.dart';

abstract class ThemeRepository {
  Future<ThemeMode> themeMode();
  updateThemeMode(ThemeMode theme);
}
