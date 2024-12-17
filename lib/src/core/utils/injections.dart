import 'package:applossen/src/features/theme/data/data_sources/data_source_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/theme/data/repositories/repository_impl.dart';
import '../../features/theme/domain/repositories/theme_repository.dart';
import '../../features/theme/domain/usecases/theme_usecase.dart';
import '../../features/theme/presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  GetIt.I.registerSingleton<ThemeDataSourceImpl>(ThemeDataSourceImpl());
}

Widget initializeRepositories({required Widget child}) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider<ThemeRepository>(
          create: (context) => ThemeRepositoryImpl(ThemeDataSourceImpl())),
    ],
    child: child,
  );
}

Widget initializeBlocs({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(
              ThemeUsecase(RepositoryProvider.of<ThemeRepository>(context)))),
    ],
    child: child,
  );
}
