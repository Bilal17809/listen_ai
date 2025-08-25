class VoiceSettings {
  final String voice;
  final double volume;
  final double speed;

  VoiceSettings({
    required this.voice,
    required this.volume,
    required this.speed,
  });

  VoiceSettings copyWith({
    String? voice,
    double? volume,
    double? speed,
  }) {
    return VoiceSettings(
      voice: voice ?? this.voice,
      volume: volume ?? this.volume,
      speed: speed ?? this.speed,
    );
  }
}