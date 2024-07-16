import 'package:insomnia_app/Models/alarm_model.dart';

class AlarmRepository {
  List<AlarmModel> alarms = [
    AlarmModel(
      alarmTime: DateTime.now(),
      alarmTitle: "Monday Alarm",
      isTurnedOn: false,
    ),
    AlarmModel(
      alarmTime: DateTime.now(),
      alarmTitle: "Monday Alarm",
      isTurnedOn: true,
    ),
    AlarmModel(
      alarmTime: DateTime.now(),
      alarmTitle: "Monday Alarm",
      isTurnedOn: false,
    ),
    AlarmModel(
      alarmTime: DateTime.now(),
      alarmTitle: "Monday Alarm",
      isTurnedOn: true,
    ),
    AlarmModel(
      alarmTime: DateTime.now(),
      alarmTitle: "Monday Alarm",
      isTurnedOn: false,
    ),
  ];
}
