import 'package:get/get.dart';
import '../../../core/local_storage/local_storage_service.dart';

class SettingsController extends GetxController {
  static const String _voiceSettingKey = 'selected_voice';
  static const String defaultVoice = 'male'; // agar kuch save na ho

  // ✅ observable variable jo UI ko update karega
  final RxString _selectedVoice = defaultVoice.obs;

  String get selectedVoice => _selectedVoice.value;

  @override
  void onInit() {
    super.onInit();
    _loadVoiceSetting(); // App open hote hi storage check karega
  }

  Future<void> _loadVoiceSetting() async {
    try {
      final String? savedVoice = await LocalStorageService.getString(_voiceSettingKey);
      if (savedVoice != null) {
        _selectedVoice.value = savedVoice; // ✅ saved value set kar do
      } else {
        _selectedVoice.value = defaultVoice; // ✅ fallback agar kuch na ho
      }
      print("🎤 Loaded voice from storage: ${_selectedVoice.value}");
    } catch (e) {
      print("❌ Error loading voice setting: $e");
      _selectedVoice.value = defaultVoice; // error me bhi default rakho
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
