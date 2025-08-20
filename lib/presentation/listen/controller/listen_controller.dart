import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class ListenController extends GetxController {
  final audioPlayer = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxDouble position = 0.0.obs;
  RxDouble duration = 0.0.obs;
  RxString currentText = "".obs;
  RxBool isInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();

    audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying.value = state == PlayerState.playing;
    });

    audioPlayer.onDurationChanged.listen((d) {
      duration.value = d?.inSeconds.toDouble() ?? 0;
      isInitialized.value = true;
    });

    audioPlayer.onPositionChanged.listen((p) {
      position.value = p.inSeconds.toDouble();
    });
  }

  String getTtsUrl(String text,
      {String langCode = 'en', double speed = 1.0, double pitch = 1.0}) {
    final encoded = Uri.encodeComponent(text);
    return 'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=$encoded&tl=$langCode&ttsspeed=$speed&pitch=$pitch';
  }

  Future<void> prepareText(String text) async {
    if (text.isEmpty) return;
    currentText.value = text;

    final url = getTtsUrl(text);


    await audioPlayer.setSourceUrl(url);


    final d = await audioPlayer.getDuration();
    duration.value = d?.inSeconds.toDouble() ?? 0;
  }

  Future<void> play() async {
    if (!isInitialized.value) return;
    await audioPlayer.resume();
  }

  Future<void> pause() async => await audioPlayer.pause();

  Future<void> stop() async => await audioPlayer.stop();

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }
}
