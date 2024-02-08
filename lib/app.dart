import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qcplayer/pages/home.dart';
import 'package:qcplayer/states/app.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      locale: appState.locale,
      themeMode: appState.appThemeMode,
      home: const Home()
    );
  }
}