

import 'package:audioplayers/audioplayers.dart';

import '../../domain/repositories/tts_repository.dart';

class TtsRepositoryImpl implements TtsRepository {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Stream<PlayerState> get playerStateStream => _audioPlayer.onPlayerStateChanged;

  @override
  Stream<void> get playerCompleteStream => _audioPlayer.onPlayerComplete;

  @override
  Future<void> playText(String text) async {
    await _audioPlayer.setSourceUrl(text);
    await _audioPlayer.resume();
  }

  @override
  Future<void> playFromUrl(String url) async {
    await playText(url);
  }

  @override
  Future<void> resume() async {
    await _audioPlayer.resume();
  }

  @override
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  @override
  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
  }
}