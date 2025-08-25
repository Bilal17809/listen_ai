import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_constants.dart';
import '../../../core/local_storage/local_storage_service.dart';

class SettingsController extends GetxController {
  final RxString _selectedVoice = AppConstants.defaultVoice.obs;
  final RxDouble _volumeLevel = AppConstants.defaultVolume.obs;
  final RxDouble _speechSpeed = AppConstants.defaultSpeed.obs;
  final RxBool _isLoading = true.obs;

  String get selectedVoice => _selectedVoice.value;
  double get volumeLevel => _volumeLevel.value;
  double get speechSpeed => _speechSpeed.value;
  bool get isLoading => _isLoading.value;
  final RxBool _isDarkMode = false.obs;
  bool get isDarkMode => _isDarkMode.value;

  @override
  void onInit() {
    super.onInit();
    _loadAllSettings();
  }

  Future<void> _loadAllSettings() async {
    _isLoading.value = true;
    await _loadVoiceSetting();
    await _loadVolumeSetting();
    await _loadSpeedSetting();
    await _loadThemeSetting();
    _isLoading.value = false;
  }

  Future<void> _loadVoiceSetting() async {
    try {
      final String? savedVoice = await LocalStorageService.getString(
        AppConstants.voiceSettingKey,
      );
      _selectedVoice.value = savedVoice ?? AppConstants.defaultVoice;
    } catch (e) {
      _selectedVoice.value = AppConstants.defaultVoice;
    }
  }

  Future<void> _loadVolumeSetting() async {
    try {
      final double? savedVolume = await LocalStorageService.getDouble(
        AppConstants.volumeSettingKey,
      );
      _volumeLevel.value = savedVolume ?? AppConstants.defaultVolume;
    } catch (e) {
      _volumeLevel.value = AppConstants.defaultVolume;
    }
  }

  Future<void> _loadSpeedSetting() async {
    try {
      final double? savedSpeed = await LocalStorageService.getDouble(
        AppConstants.speedSettingKey,
      );
      _speechSpeed.value = savedSpeed ?? AppConstants.defaultSpeed;
    } catch (e) {
      _speechSpeed.value = AppConstants.defaultSpeed;
    }
  }

  Future<void> _loadThemeSetting() async {
    _isDarkMode.value = await LocalStorageService.isDarkTheme();
  }

  Future<void> setVoice(String voice) async {
    try {
      await LocalStorageService.saveString(AppConstants.voiceSettingKey, voice);
      _selectedVoice.value = voice;
    } catch (e) {
      Get.snackbar("Error", "Failed to save voice setting");
    }
  }

  Future<void> setVolume(double volume) async {
    try {
      await LocalStorageService.saveDouble(
        AppConstants.volumeSettingKey,
        volume,
      );
      _volumeLevel.value = volume;
    } catch (e) {
      Get.snackbar("Error", "Failed to save volume setting");
    }
  }

  Future<void> setSpeechSpeed(double speed) async {
    try {
      await LocalStorageService.saveDouble(AppConstants.speedSettingKey, speed);
      _speechSpeed.value = speed;
    } catch (e) {
      Get.snackbar("Error", "Failed to save speed setting");
    }
  }
  Future<void> toggleTheme() async {
    _isDarkMode.value = !_isDarkMode.value;
    await LocalStorageService.saveTheme(_isDarkMode.value);
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  bool isFemaleVoiceSelected() => selectedVoice == 'female';
  bool isMaleVoiceSelected() => selectedVoice == 'male';
}
