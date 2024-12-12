import 'package:applossen/src/features/theme/data/data_sources/data_source_impl.dart';
import 'package:applossen/src/features/theme/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

//TODO: init settings bloc repo etc
void setupLocator() {
  GetIt.I.registerSingleton<ThemeDataSourceImpl>(ThemeDataSourceImpl());
}

class Dio {}

Widget initializeBlocs({required Widget child}) {
  return MultiBlocProvider(
    child: child,
    providers: [
      BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
    ],
  );
}
