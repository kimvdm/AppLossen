import 'package:flutter/material.dart';

abstract class ThemeRepository {
  ThemeMode themeMode();
  updateThemeMode(ThemeMode theme);
}
