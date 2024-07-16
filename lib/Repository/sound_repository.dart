import '../Constants/app_styles.dart';
import '../Models/sound_model.dart';

class SoundRepository {
  // Meditation Sounds
  List<SoundModel> meditationSounds = [
    SoundModel(
      soundName: "Peaceful Slumber",
      length: '4:18',
      soundUrl: AppStyles.sound1,
      isMeditationSound: true,
      isSleepSound: true,
    ),
    SoundModel(
      soundName: "Tranquil Twilight",
      length: '2:46',
      soundUrl: AppStyles.sound2,
      isMeditationSound: true,
      isSleepSound: true,
    ),
    SoundModel(
      soundName: "Serene serenade",
      length: '1:53',
      soundUrl: AppStyles.sound3,
      isMeditationSound: true,
      isSleepSound: true,
    ),
    SoundModel(
      soundName: "Velvet Whispers",
      length: '2:13',
      soundUrl: AppStyles.sound4,
      isMeditationSound: true,
      isSleepSound: true,
    ),
    SoundModel(
      soundName: "Inner Harmony",
      length: '2:22',
      soundUrl: AppStyles.sound5,
      isMeditationSound: true,
      isSleepSound: true,
    ),
  ];

  // Sleep Sounds
  List<SoundModel> sleepSounds = [
    SoundModel(
      soundName: "Velvet Whispers",
      length: '2:13',
      soundUrl: AppStyles.sound4,
      isMeditationSound: true,
      isSleepSound: true,
    ),
    SoundModel(
      soundName: "Inner Harmony",
      length: '2:22',
      soundUrl: AppStyles.sound5,
      isMeditationSound: true,
      isSleepSound: true,
    ),
    SoundModel(
      soundName: "Mindful Oasis",
      length: '2:19',
      soundUrl: AppStyles.sound6,
      isMeditationSound: true,
      isSleepSound: true,
    ),
  ];
}
