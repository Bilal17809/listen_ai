import 'dart:async';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import '../../../core/local_storage/local_storage_service.dart';
import '../../../core/utils/text_utils.dart';
import '../../../data/services/tts_service.dart';
import '../../settings/controller/settings_controller.dart';

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

  // void _setupAudioListeners() {
  //   _ttsService.audioPlayer.onPlayerStateChanged.listen((state) {
  //     isPlaying.value = state == PlayerState.playing;
  //   });
  //
  //   _ttsService.audioPlayer.onPlayerComplete.listen((event) async {
  //     if (_currentChunkIndex < _chunks.length - 1) {
  //       _currentChunkIndex++;
  //       await _playCurrentChunk();
  //     } else {
  //       isPlaying.value = false;
  //       _currentChunkIndex = 0;
  //       await _ttsService.stop();
  //     }
  //   });
  // }

  void _setupAudioListeners() {
    _ttsService.audioPlayer.playerStateStream.listen((state) async {
      // Playing / paused state
      isPlaying.value = state.playing;

      // Audio completed
      if (state.processingState == ProcessingState.completed) {
        if (_currentChunkIndex < _chunks.length - 1) {
          _currentChunkIndex++;
          await _playCurrentChunk();
        } else {
          isPlaying.value = false;
          _currentChunkIndex = 0;
          await _ttsService.stop();
        }
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
      final url = TtsService.getTtsUrl(_chunks[_currentChunkIndex]);

      // ✅ Get voice from SharedPreferences instead of controller
      final savedVoice = await LocalStorageService.getString('selected_voice');
      final voice = savedVoice ?? 'male'; // default 'male' agar null ho

      await _ttsService.playFromUrl(url, voice: voice);

      print("🎙 Playing chunk with voice: $voice");
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
