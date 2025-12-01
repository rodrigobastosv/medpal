import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  Future<void> clearStorage() async {
    try {
      await sharedPreferences.clear();
    } catch (exception) {
      log('Error clearing all keys from storage');
    }
  }

  Future<void> deleteValue(String key) async {
    try {
      await sharedPreferences.remove(key);
    } catch (exception) {
      log('Error deleting key $key from storage');
    }
  }

  bool? readBoolValue(String key) {
    try {
      return sharedPreferences.getBool(key);
    } catch (exception) {
      log('Error reading key $key from storage');
      return null;
    }
  }

  Future<void> writeBoolValue({required String key, required bool value}) async {
    try {
      await sharedPreferences.setBool(key, value);
    } catch (exception) {
      log('Error writing value $value to the key $key on storage');
    }
  }

  Map<String, dynamic>? readJsonValue(String key) {
    try {
      final encodedString = sharedPreferences.getString(key);
      return encodedString != null ? jsonDecode(encodedString) : null;
    } catch (exception) {
      log('Error reading key $key from storage');
      return null;
    }
  }

  Future<void> writeJsonValue({required String key, required Map<String, dynamic> value}) async {
    try {
      await sharedPreferences.setString(key, jsonEncode(value));
    } catch (exception) {
      log('Error writing value $value to the key $key on storage');
    }
  }
}
