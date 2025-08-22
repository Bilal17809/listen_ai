import 'package:get/get.dart';
import '../../../core/local_storage/local_storage_service.dart';

class SettingsController extends GetxController {
  static const String _voiceSettingKey = 'selected_voice';
  static const String defaultVoice = 'male';


  final RxString _selectedVoice = defaultVoice.obs;

  String get selectedVoice => _selectedVoice.value;

  @override
  void onInit() {
    super.onInit();
    _loadVoiceSetting();
  }

  Future<void> _loadVoiceSetting() async {
    try {
      final String? savedVoice = await LocalStorageService.getString(_voiceSettingKey);
      if (savedVoice != null) {
        _selectedVoice.value = savedVoice;
      } else {
        _selectedVoice.value = defaultVoice;
      }
      print("🎤 Loaded voice from storage: ${_selectedVoice.value}");
    } catch (e) {
      print("❌ Error loading voice setting: $e");
      _selectedVoice.value = defaultVoice;
    }
  }

  Future<void> setVoice(String voice) async {
    _selectedVoice.value = voice;
    try {
      await LocalStorageService.saveString(_voiceSettingKey, voice);
      print("✅ Voice saved: $voice");
    } catch (e) {
      Get.snackbar("Error", "Failed to save voice setting");
    }
  }

  bool isFemaleVoiceSelected() => selectedVoice == 'female';
  bool isMaleVoiceSelected() => selectedVoice == 'male';
}
