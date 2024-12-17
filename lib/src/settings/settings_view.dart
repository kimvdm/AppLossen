import 'package:applossen/src/features/theme/presentation/bloc/bloc.dart';
import 'package:applossen/src/features/theme/presentation/bloc/event.dart';
import 'package:applossen/src/features/theme/presentation/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if (state is ThemeLoaded) {
              return DropdownButton<ThemeMode>(
                value: state.themeMode,
                onChanged: (ThemeMode? newMode) {
                  if (newMode != null) {
                    context
                        .read<ThemeBloc>()
                        .add(UpdateThemeModeEvent(newMode));
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text('System Theme'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text('Light Theme'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text('Dark Theme'),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('Failed to load settings'));
            }
          },
        ),
      ),
    );
  }
}
