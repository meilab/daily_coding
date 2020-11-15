import 'dart:async';

import 'package:flutter/material.dart';
import 'package:daily_coding/i18n/my_localizations.dart';

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return [
      'en',
      'zh', /*'zh-tw'*/
    ].contains(locale.languageCode);
  }

  @override
  Future<MyLocalizations> load(Locale locale) => MyLocalizations.load(locale);

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;

  static List<Locale> supportedLocales() {
    return [const Locale('en', 'US'), const Locale('zh', 'CN')];
  }
}
