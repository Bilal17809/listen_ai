import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';
import '../../presentation/settings/controller/settings_controller.dart';

class TtsService {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final SettingsController _settingsController = Get.find<SettingsController>();

  AudioPlayer get audioPlayer => _audioPlayer;

  static String getTtsUrl(String text, {String langCode = 'en'}) {
    final encoded = Uri.encodeComponent(text);
    return 'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=$encoded&tl=$langCode&tld=com';
  }

  Future<void> playFromUrl(String url, {String voice = "female"}) async {
    try {
      await _audioPlayer.stop();


      if (voice == 'male') {
        await _audioPlayer.setPitch(0.8);
      } else {
        await _audioPlayer.setPitch(1.2);
      }

      await _audioPlayer.setVolume(_settingsController.volumeLevel);
      await _audioPlayer.setSpeed(_settingsController.speechSpeed);

      await _audioPlayer.setUrl(url);
      await _audioPlayer.play();
    } catch (e) {
      //
    }
  }

  Future<void> resume() async {
    await _audioPlayer.play();
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}