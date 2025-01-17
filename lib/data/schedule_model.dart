import 'package:json_annotation/json_annotation.dart';

part 'schedule_model.g.dart';

@JsonSerializable()
class Schedule {
  final String day;
  final String time;
  final String location;
  final String id;

  Schedule({
    required this.day,
    required this.time,
    required this.location,
    required this.id,
  });

  factory Schedule.fromJson(Map<String, dynamic> json, String id) {
    final model = _$ScheduleFromJson(json);
    return model.copyWith(id: id);
  }

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);

  Schedule copyWith({
    String? day,
    String? time,
    String? location,
    String? id,
  }) {
    return Schedule(
      day: day ?? this.day,
      time: time ?? this.time,
      location: location ?? this.location,
      id: id ?? this.id,
    );
  }
}
