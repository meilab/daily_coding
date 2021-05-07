import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences _prefs;
  bool isPrefInitialized = false;

  // should call init first and make sure _prefs is inited
  Future init() async {
    _prefs = await SharedPreferences.getInstance();
    isPrefInitialized = true;
  }

  /// put object list.
  Future<bool> putObjectList(String key, List<Object> list) {
    List<String> _dataList = list.map((value) {
      return json.encode(value);
    }).toList();
    return _prefs.setStringList(key, _dataList);
  }

  /// get obj list.
  List<T> getObjList<T>(String key, T f(Map v), {List<T> defValue = const []}) {
    List<Map> dataList = getObjectList(key);
    List<T> list = dataList.map((value) {
      return f(value);
    }).toList();
    return list;
  }

  /// get object list.
  List<Map> getObjectList(String key) {
    List<String>? dataList = _prefs.getStringList(key);
    if (dataList != null) {
      return dataList.map((value) {
        Map _dataMap = json.decode(value);
        return _dataMap;
      }).toList();
    } else {
      return [];
    }
  }

  /// get string.
  String getString(String key, {String defValue = ''}) {
    return _prefs.getString(key) ?? defValue;
  }

  /// put string.
  Future<bool> putString(String key, String value) {
    return _prefs.setString(key, value);
  }

  /// get bool.
  bool getBool(String key, {bool defValue = false}) {
    return _prefs.getBool(key) ?? defValue;
  }

  /// put bool.
  Future<bool> putBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  /// get int.
  int getInt(String key, {int defValue = 0}) {
    return _prefs.getInt(key) ?? defValue;
  }

  /// put int.
  Future<bool> putInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  /// get double.
  double getDouble(String key, {double defValue = 0.0}) {
    return _prefs.getDouble(key) ?? defValue;
  }

  /// put double.
  Future<bool> putDouble(String key, double value) {
    return _prefs.setDouble(key, value);
  }

  /// get string list.
  List<String> getStringList(String key, {List<String> defValue = const []}) {
    return _prefs.getStringList(key) ?? defValue;
  }

  /// put string list.
  Future<bool> putStringList(String key, List<String> value) {
    return _prefs.setStringList(key, value);
  }

  /// get dynamic.
  dynamic getDynamic(String key, {required Object defValue}) {
    return _prefs.get(key) ?? defValue;
  }

  /// have key.
  bool haveKey(String key) {
    return _prefs.getKeys().contains(key);
  }

  /// get keys.
  Set<String> getKeys() {
    return _prefs.getKeys();
  }

  /// remove.
  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  /// clear.
  Future<bool> clear() {
    return _prefs.clear();
  }

  ///Sp is initialized.
  bool isInitialized() {
    return isPrefInitialized;
  }
}

final LocalStorage localStorageManager = LocalStorage();
