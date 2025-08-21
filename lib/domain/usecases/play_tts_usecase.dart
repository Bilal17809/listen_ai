

import '../repositories/tts_repository.dart';

class PlayTtsUseCase {
  final TtsRepository repository;

  PlayTtsUseCase(this.repository);

  Future<void> execute(String url) async {
    await repository.playFromUrl(url);
  }
}

class PauseTtsUseCase {
  final TtsRepository repository;

  PauseTtsUseCase(this.repository);

  Future<void> execute() async {
    await repository.pause();
  }
}

class StopTtsUseCase {
  final TtsRepository repository;

  StopTtsUseCase(this.repository);

  Future<void> execute() async {
    await repository.stop();
  }
}

class ResumeTtsUseCase {
  final TtsRepository repository;

  ResumeTtsUseCase(this.repository);

  Future<void> execute() async {
    await repository.resume();
  }
}