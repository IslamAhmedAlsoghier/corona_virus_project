import 'package:flutter/material.dart';

class Language {
  final int Id;
  final String name;
  final String flags;
  final String languageCode;

  Language(this.Id, this.name, this.flags, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, 'English', 'US', 'en'),
      Language(2, 'Arabic', 'EG', 'ar')
    ];
  }
}
