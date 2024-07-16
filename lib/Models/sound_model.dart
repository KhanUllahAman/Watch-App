class SoundModel {
  final String soundName;
  final String soundUrl;
  bool isMeditationSound;
  bool isSleepSound;
  String length;
  bool isPlaying = false;
  SoundModel({
    required this.length,
    required this.soundName,
    required this.soundUrl,
    required this.isMeditationSound,
    required this.isSleepSound,
  });
}
