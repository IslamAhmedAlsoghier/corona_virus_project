import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetLocalization {
  final Locale locale;

  SetLocalization(
    this.locale,
  );

  static SetLocalization Of(BuildContext context) {
    return Localizations.of<SetLocalization>(context, SetLocalization)!;
  }

  static const LocalizationsDelegate<SetLocalization> localizationsDelegate =
      _GetlocalizationDelegate();

  Map<String, String>? _localizedValues;

  Future<bool> load() async {
    String jsonLoadValues =
        await rootBundle.loadString('Lang_Jasons/${locale.languageCode}.json');
    Map<String, dynamic> mappedJason = json.decode(jsonLoadValues);
    _localizedValues = mappedJason.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String? getTranslateValues(String key) {
    return _localizedValues![key];
  }

  String getCurrentCode() {
    return locale.languageCode;
  }
}

class _GetlocalizationDelegate extends LocalizationsDelegate<SetLocalization> {
  const _GetlocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<SetLocalization> load(Locale locale) async {
    SetLocalization localization = new SetLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<SetLocalization> old) {
    return false;
  }
}
