import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/theme_usecase.dart';
import 'event.dart';
import 'state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeUsecase useCase;

  final _stateController = StreamController<ThemeState>.broadcast();
  final _eventController = StreamController<ThemeEvent>();

  Sink<ThemeEvent> get eventSink => _eventController.sink;

  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeBloc(this.useCase) : super(ThemeInitial()) {
    add(LoadThemeEvent());
  }

  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    switch (event.runtimeType) {
      case LoadThemeEvent _:
        yield* loadSettings();
        break;
      case UpdateThemeModeEvent _:
        yield* updateThemeMode((event as UpdateThemeModeEvent).newThemeMode);
        break;
    }
  }

  Stream<ThemeState> loadSettings() async* {
    _currentThemeMode = useCase.getThemeMode();
    yield ThemeLoaded(_currentThemeMode);
  }

  Stream<ThemeState> updateThemeMode(ThemeMode newThemeMode) async* {
    if (newThemeMode != _currentThemeMode) {
      _currentThemeMode = newThemeMode;
      await useCase.updateThemeMode(newThemeMode);
      yield ThemeLoaded(_currentThemeMode);
    }
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}
