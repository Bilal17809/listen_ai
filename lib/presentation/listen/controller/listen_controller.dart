import 'dart:async';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import '../../../core/local_storage/local_storage_service.dart';
import '../../../core/utils/text_utils.dart';
import '../../../data/services/tts_service.dart';

class ListenController extends GetxController {
  final TtsService _ttsService;

  final isPlaying = false.obs;
  final currentText = ''.obs;
  late List<String> _chunks;
  int _currentChunkIndex = 0;
  bool _isCompleted = false;

  ListenController(this._ttsService);

  @override
  void onInit() {
    super.onInit();
    _setupAudioListeners();
  }

  void _setupAudioListeners() {
    _ttsService.audioPlayer.playerStateStream.listen((state) async {
      isPlaying.value = state.playing;

      if (state.processingState == ProcessingState.completed) {
        if (_currentChunkIndex < _chunks.length - 1) {
          _currentChunkIndex++;
          await _playCurrentChunk();
        } else {
          await _handlePlaybackCompletion();
        }
      }
    });
  }

  Future<void> _handlePlaybackCompletion() async {
    await _ttsService.stop();
    isPlaying.value = false;
    _isCompleted = true;
  }

  Future<void> prepareText(String text) async {
    if (text.trim().isEmpty) return;

    currentText.value = text;
    _chunks = TextUtils.splitText(text);
    _currentChunkIndex = 0;
    _isCompleted = false;

    if (_chunks.isNotEmpty) {
      await _playCurrentChunk();
    }
  }

  Future<void> _playCurrentChunk() async {
    if (_currentChunkIndex >= _chunks.length) return;
    final chunk = _chunks[_currentChunkIndex];
    final url = TtsService.getTtsUrl(chunk);
    final selectedVoice = await LocalStorageService.getSelectedVoice();
    await _ttsService.playFromUrl(url, voice: selectedVoice);
  }

  Future<void> play() async {
    if (_chunks.isEmpty) return;

    if (_isCompleted) {
      _currentChunkIndex = 0;
      _isCompleted = false;
      await _playCurrentChunk();
    } else {
      await _ttsService.resume();
    }
  }

  Future<void> pause() async {
    await _ttsService.pause();
  }

  Future<void> stop() async {
    await _ttsService.stop();
    _currentChunkIndex = 0;
    _isCompleted = false;
    isPlaying.value = false;
  }

  Future<void> togglePlayPause() async {
    if (isPlaying.value) {
      await pause();
    } else {
      await play();
    }
  }

  bool get isPlaybackComplete => _isCompleted;

  @override
  void onClose() {
    _ttsService.dispose();
    super.onClose();
  }
}
