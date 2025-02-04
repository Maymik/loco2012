// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      day: json['day'] as String,
      time: json['time'] as String,
      location: json['location'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
      'location': instance.location,
      'id': instance.id,
    };
