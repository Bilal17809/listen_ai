import 'package:audioplayers/audioplayers.dart';

abstract class TtsRepository {
  Future<void> playText(String text);
  Future<void> playFromUrl(String url);
  Future<void> resume();
  Future<void> pause();
  Future<void> stop();
  void dispose();
  Stream<PlayerState> get playerStateStream;
  Stream<void> get playerCompleteStream;
}