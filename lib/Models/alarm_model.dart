// ignore_for_file: public_member_api_docs, sort_constructors_first
class AlarmModel {
  final DateTime alarmTime;
  final String alarmTitle;
  bool isTurnedOn;
  AlarmModel({
    required this.alarmTime,
    required this.alarmTitle,
    required this.isTurnedOn,
  });
}
