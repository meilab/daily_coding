import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences _prefs;

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// put object list.
  Future<bool> putObjectList(String key, List<Object> list) {
    if (_prefs == null) return null;
    List<String> _dataList = list?.map((value) {
      return json.encode(value);
    })?.toList();
    return _prefs.setStringList(key, _dataList);
  }

  /// get obj list.
  List<T> getObjList<T>(String key, T f(Map v), {List<T> defValue = const []}) {
    List<Map> dataList = getObjectList(key);
    List<T> list = dataList?.map((value) {
      return f(value);
    })?.toList();
    return list ?? defValue;
  }

  /// get object list.
  List<Map> getObjectList(String key) {
    if (_prefs == null) return null;
    List<String> dataLis = _prefs.getStringList(key);
    return dataLis?.map((value) {
      Map _dataMap = json.decode(value);
      return _dataMap;
    })?.toList();
  }

  /// get string.
  String getString(String key, {String defValue = ''}) {
    if (_prefs == null) return defValue;
    return _prefs.getString(key) ?? defValue;
  }

  /// put string.
  Future<bool> putString(String key, String value) {
    if (_prefs == null) return null;
    return _prefs.setString(key, value);
  }

  /// get bool.
  bool getBool(String key, {bool defValue = false}) {
    if (_prefs == null) return defValue;
    return _prefs.getBool(key) ?? defValue;
  }

  /// put bool.
  Future<bool> putBool(String key, bool value) {
    if (_prefs == null) return null;
    return _prefs.setBool(key, value);
  }

  /// get int.
  int getInt(String key, {int defValue = 0}) {
    if (_prefs == null) return defValue;
    return _prefs.getInt(key) ?? defValue;
  }

  /// put int.
  Future<bool> putInt(String key, int value) {
    if (_prefs == null) return null;
    return _prefs.setInt(key, value);
  }

  /// get double.
  double getDouble(String key, {double defValue = 0.0}) {
    if (_prefs == null) return defValue;
    return _prefs.getDouble(key) ?? defValue;
  }

  /// put double.
  Future<bool> putDouble(String key, double value) {
    if (_prefs == null) return null;
    return _prefs.setDouble(key, value);
  }

  /// get string list.
  List<String> getStringList(String key, {List<String> defValue = const []}) {
    if (_prefs == null) return defValue;
    return _prefs.getStringList(key) ?? defValue;
  }

  /// put string list.
  Future<bool> putStringList(String key, List<String> value) {
    if (_prefs == null) return null;
    return _prefs.setStringList(key, value);
  }

  /// get dynamic.
  dynamic getDynamic(String key, {Object defValue}) {
    if (_prefs == null) return defValue;
    return _prefs.get(key) ?? defValue;
  }

  /// have key.
  bool haveKey(String key) {
    if (_prefs == null) return null;
    return _prefs.getKeys().contains(key);
  }

  /// get keys.
  Set<String> getKeys() {
    if (_prefs == null) return null;
    return _prefs.getKeys();
  }

  /// remove.
  Future<bool> remove(String key) {
    if (_prefs == null) return null;
    return _prefs.remove(key);
  }

  /// clear.
  Future<bool> clear() {
    if (_prefs == null) return null;
    return _prefs.clear();
  }

  ///Sp is initialized.
  bool isInitialized() {
    return _prefs != null;
  }
}

final LocalStorage localStorageManager = LocalStorage();
