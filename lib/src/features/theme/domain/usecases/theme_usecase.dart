import 'package:flutter/material.dart';

import '../repositories/theme_repository.dart';

class ThemeUsecase {
  final ThemeRepository _themeRepository;

  ThemeUsecase(this._themeRepository);

  ThemeMode getThemeMode() {
    return _themeRepository.themeMode();
  }

  updateThemeMode(ThemeMode themeMode) {
    return _themeRepository.updateThemeMode(themeMode);
  }
}
