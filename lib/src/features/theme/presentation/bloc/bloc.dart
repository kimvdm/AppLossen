import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/theme_usecase.dart';
import 'event.dart';
import 'state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeUsecase useCase;
  late ThemeMode _currentThemeMode;

  ThemeBloc(this.useCase) : super(ThemeInitial()) {
    on<LoadThemeEvent>(_onLoadThemeEvent);
    on<UpdateThemeModeEvent>(_onUpdateThemeModeEvent);

    add(LoadThemeEvent());
  }

  Future<void> _onLoadThemeEvent(
      LoadThemeEvent event, Emitter<ThemeState> emit) async {
    await useCase
        .getThemeMode()
        .then((themeMode) => {_currentThemeMode = themeMode});
    emit(ThemeLoaded(_currentThemeMode));
  }

  Future<void> _onUpdateThemeModeEvent(
      UpdateThemeModeEvent event, Emitter<ThemeState> emit) async {
    if (event.newThemeMode != _currentThemeMode) {
      _currentThemeMode = event.newThemeMode;
      await useCase.updateThemeMode(event.newThemeMode);
      emit(ThemeLoaded(_currentThemeMode));
    }
  }
}
