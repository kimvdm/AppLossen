import 'package:applossen/src/features/theme/domain/repositories/theme_repository.dart';
import 'package:flutter/material.dart';

import '../data_sources/data_source_impl.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeDataSource _dataSource;

  ThemeRepositoryImpl(this._dataSource);

  @override
  ThemeMode themeMode() {
    return _dataSource.themeMode();
  }

  @override
  updateThemeMode(ThemeMode themeMode) {
    return _dataSource.updateThemeMode(themeMode);
  }
}
