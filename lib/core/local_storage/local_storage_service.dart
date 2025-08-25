import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/app_constants.dart';

class LocalStorageService {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> get _instance async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<void> saveString(String key, String value) async {
    final prefs = await _instance;
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await _instance;
    return prefs.getString(key);
  }

  static Future<void> saveDouble(String key, double value) async {
    final prefs = await _instance;
    await prefs.setDouble(key, value);
  }

  static Future<double?> getDouble(String key) async {
    final prefs = await _instance;
    return prefs.getDouble(key);
  }

  static Future<void> clearKey(String key) async {
    final prefs = await _instance;
    await prefs.remove(key);
  }

  // Theme Methods
  static Future<bool> isDarkTheme() async {
    final String? savedTheme = await _getSavedTheme();
    return savedTheme == 'dark';
  }

  static Future<String?> _getSavedTheme() async {
    final prefs = await _instance;
    return prefs.getString(AppConstants.themeKey);
  }

  static Future<void> saveTheme(bool isDark) async {
    final prefs = await _instance;
    await prefs.setString(AppConstants.themeKey, isDark ? 'dark' : 'light');
  }

  static Future<void> toggleTheme() async {
    final bool currentTheme = await isDarkTheme();
    await saveTheme(!currentTheme);
    Get.changeThemeMode(!currentTheme ? ThemeMode.dark : ThemeMode.light);
  }

  static Future<String> getSelectedVoice() async {
    final voice = await getString(AppConstants.voiceSettingKey);
    return voice ?? AppConstants.defaultVoice;
  }

  static Future<double> getVolumeLevel() async {
    final volume = await getDouble(AppConstants.volumeSettingKey);
    return volume ?? AppConstants.defaultVolume;
  }

  static Future<double> getSpeechSpeed() async {
    final speed = await getDouble(AppConstants.speedSettingKey);
    return speed ?? AppConstants.defaultSpeed;
  }
}