import 'package:just_audio/just_audio.dart';

class TtsService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  static String getTtsUrl(String text, {String langCode = 'en'}) {
    final encoded = Uri.encodeComponent(text);
    return 'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=$encoded&tl=$langCode&tld=com';
  }

  Future<void> playFromUrl(String url, {String voice = "female"}) async {
    try {
      await _audioPlayer.stop();

      if (voice == 'male') {
        await _audioPlayer.setSpeed(1.0);
        await _audioPlayer.setPitch(0.7);
      } else {
        await _audioPlayer.setSpeed(1.0);
        await _audioPlayer.setPitch(1.2);
      }

      await _audioPlayer.setUrl(url);
      await _audioPlayer.play();
    } catch (e) {}
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
