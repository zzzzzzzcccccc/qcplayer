import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qcplayer/constants/common.dart';
import 'package:qcplayer/model/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appStateProvider = StateNotifierProvider<AppStateNotifier, AppModel>((ref) => AppStateNotifier());

final localeSessionKey = '${Common.sessionNameSpace}_locale';
final appThemeModeSessionKey = '${Common.sessionNameSpace}_appThemeMode';

class AppStateNotifier extends StateNotifier<AppModel> {
  AppStateNotifier() : super(AppModel());

  void setLocale(Locale locale) {
    state.locale = locale;
    _saveToSession(localeSessionKey, locale.toString());
  }

  void setAppThemeMode(ThemeMode appThemeMode) {
    state.appThemeMode = appThemeMode;
    _saveToSession(appThemeModeSessionKey, appThemeMode.name);
  }

  Future<void> loadFromSession() async {
    final instance = await SharedPreferences.getInstance();

    _setLocaleFromSession(instance);
    _setAppThemeModeFromSession(instance);
  }

  Future<void> _saveToSession(String key, String value) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(key, value);
  }

  void _setLocaleFromSession(SharedPreferences instance) {
    final localeSession = instance.getString(localeSessionKey);

    if (localeSession != null) {
      setLocale(
        Locale.fromSubtags(
          languageCode: localeSession.split('_')[0],
          countryCode: localeSession.split('_')[1]
        )
      )
    }
  }

  void _setAppThemeModeFromSession(SharedPreferences instance) {
    final appThemeModeSession = instance.getString(appThemeModeSessionKey);

    if (appThemeModeSession != null) {
      setAppThemeMode(ThemeMode.values.firstWhere((e) => e.name == appThemeModeSession));
    }
  }
}
