import 'package:corona_virus_app/localization/set_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// String? getTranslated(BuildContext context, String key) {
//   return SetLocalization.Of(context).getTranslateValues(key);
// }

const String ARABIC = 'ar';
const String ENGLISH = 'en';
const String LANG_CODE = 'LANG_CODE';

Future<Locale> setLocale(String langCode) async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  await _preferences.setString(LANG_CODE, langCode);
  return _locale(langCode);
}

Locale _locale(String langCode) {
  Locale _temp;

  switch (langCode) {
    case ARABIC:
      _temp = Locale(langCode, 'EG');
      break;
    case ENGLISH:
      _temp = Locale(langCode, 'US');
      break;
    default:
      _temp = Locale(ENGLISH, 'US');
  }
  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  String langCode = _preferences.getString(LANG_CODE) ?? ENGLISH;
  return _locale(langCode);
}
