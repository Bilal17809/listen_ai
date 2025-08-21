import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import '../../../core/utils/text_utils.dart';
import '../../../data/services/tts_service.dart';

class ListenController extends GetxController {
  final TtsService _ttsService;

  RxBool isPlaying = false.obs;
  RxString currentText = "".obs;

  List<String> _chunks = [];
  int _currentChunkIndex = 0;

  ListenController(this._ttsService);

  @override
  void onInit() {
    super.onInit();
    _setupAudioListeners();
  }

  void _setupAudioListeners() {
    _ttsService.audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying.value = state == PlayerState.playing;
    });

    _ttsService.audioPlayer.onPlayerComplete.listen((event) async {
      if (_currentChunkIndex < _chunks.length - 1) {
        _currentChunkIndex++;
        await _playCurrentChunk();
      } else {
        isPlaying.value = false;
        _currentChunkIndex = 0;
        await _ttsService.stop();
      }
    });
  }

  Future<void> prepareText(String text) async {
    if (text.isEmpty) return;

    currentText.value = text;
    _chunks = TextUtils.splitText(text);
    _currentChunkIndex = 0;

    if (_chunks.isNotEmpty) {
      await _playCurrentChunk();
    }
  }

  Future<void> _playCurrentChunk() async {
    if (_currentChunkIndex < _chunks.length) {
      final url = TextUtils.getTtsUrl(_chunks[_currentChunkIndex]);
      await _ttsService.playFromUrl(url);
    }
  }

  Future<void> play() async {
    if (_chunks.isEmpty) return;

    if (!isPlaying.value) {
      if (_currentChunkIndex >= _chunks.length) {
        _currentChunkIndex = 0;
      }
      await _playCurrentChunk();
    }
  }

  Future<void> pause() async {
    await _ttsService.pause();
  }

  Future<void> stop() async {
    await _ttsService.stop();
    _currentChunkIndex = 0;
    isPlaying.value = false;
  }

  @override
  void onClose() {
    _ttsService.dispose();
    super.onClose();
  }
}
