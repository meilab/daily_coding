import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsNotifier extends ChangeNotifier {
  Locale _locale = Locale('zh', 'CN');

  getCurrentLocale() => _locale;

  setCurrentLocale(Locale value) {
    _locale = value;
    notifyListeners();
  }
}
