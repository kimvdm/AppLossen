import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/utils/injections.dart';
import 'features/theme/presentation/bloc/bloc.dart';
import 'features/theme/presentation/bloc/state.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return initializeRepositories(
      child: initializeBlocs(
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            // Determine the theme and theme mode from the ThemeBloc's state
            final ThemeMode themeMode = (themeState is ThemeLoaded)
                ? themeState.themeMode
                : ThemeMode.system;

            return MaterialApp(
              restorationScopeId: 'app',
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
              ],
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,
              themeMode: themeMode,
              onGenerateRoute: (RouteSettings routeSettings) {
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) {
                    switch (routeSettings.name) {
                      case SettingsView.routeName:
                        return const SettingsView(); // Modify SettingsView to no longer need settingsController
                      case SampleItemDetailsView.routeName:
                        return const SampleItemDetailsView();
                      case SampleItemListView.routeName:
                      default:
                        return const SampleItemListView();
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
