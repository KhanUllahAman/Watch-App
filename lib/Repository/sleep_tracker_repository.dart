import 'package:insomnia_app/Models/sleep_tracker_model.dart';

class SleepTrackerRepository {
  // Sample Chart Data for Sleep
  static List<SleepTrackerModel> sleepData = [
    SleepTrackerModel(
      "Deep",
      4.2,
    ),
    SleepTrackerModel(
      "REM",
      2.4,
    ),
    SleepTrackerModel(
      "Core",
      3.6,
    ),
    SleepTrackerModel(
      "Awake",
      0.17,
    ),
  ];
}
