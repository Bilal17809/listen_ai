import 'package:audioplayers/audioplayers.dart';

class TtsService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  String getTtsUrl(String text, {String langCode = 'en'}) {
    final encoded = Uri.encodeComponent(text);
    return 'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=$encoded&tl=$langCode';
  }

  Future<void> playFromUrl(String url) async {
    await _audioPlayer.setSourceUrl(url);
    await _audioPlayer.resume();
  }

  Future<void> resume() async {
    await _audioPlayer.resume();
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