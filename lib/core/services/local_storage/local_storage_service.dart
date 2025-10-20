import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService({required this.prefs});

  final SharedPreferences prefs;

  Future<void> clearStorage() async {
    try {
      await prefs.clear();
    } catch (exception) {
      log('Error clearing all keys from storage');
    }
  }

  Future<void> deleteValue(String key) async {
    try {
      await prefs.remove(key);
    } catch (exception) {
      log('Error deleting key $key from storage');
    }
  }

  bool? readBoolValue(String key) {
    try {
      return prefs.getBool(key);
    } catch (exception) {
      log('Error reading key $key from storage');
      return null;
    }
  }

  Future<void> writeBoolValue({required String key, required bool value}) async {
    try {
      await prefs.setBool(key, value);
    } catch (exception) {
      log('Error writing value $value to the key $key on storage');
    }
  }
}
