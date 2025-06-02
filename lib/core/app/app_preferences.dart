import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/language_manager.dart';

const String prefsKeyLang = "PREFS_KEY_LANG";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  String getAppLanguage() {
    String? language = _sharedPreferences.getString(prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.arabic.getValue();
    }
  }

  bool isEnglish() {
    return getAppLanguage() == LanguageType.english.getValue();
  }

  Future<void> changeAppLanguage() async {
    String currentLang = getAppLanguage();

    if (currentLang == LanguageType.arabic.getValue()) {
      // set english
      _sharedPreferences.setString(prefsKeyLang, LanguageType.english.getValue());
    } else {
      // set arabic
      _sharedPreferences.setString(prefsKeyLang, LanguageType.arabic.getValue());
    }
  }

  Locale getLocal() {
    String currentLang = getAppLanguage();

    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }
}