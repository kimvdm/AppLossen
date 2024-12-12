import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class LoadThemeEvent extends ThemeEvent {}

class UpdateThemeModeEvent extends ThemeEvent {
  final ThemeMode newThemeMode;

  UpdateThemeModeEvent(this.newThemeMode);
}
