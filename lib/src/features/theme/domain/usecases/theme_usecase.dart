import 'package:flutter/material.dart';

import '../repositories/theme_repository.dart';

//TODO: Determine get and set should be in the same usecase
class ThemeUsecase {
  final ThemeRepository _themeRepository;

  ThemeUsecase(this._themeRepository);

  Future<ThemeMode> getThemeMode() {
    return _themeRepository.themeMode();
  }

  updateThemeMode(ThemeMode themeMode) {
    return _themeRepository.updateThemeMode(themeMode);
  }
}
