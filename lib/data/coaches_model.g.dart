// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaches_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coach _$CoachFromJson(Map<String, dynamic> json) => Coach(
      position: json['position'] as String,
      name: json['name'] as String,
      info: json['info'] as String,
      rank: json['rank'] as String,
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$CoachToJson(Coach instance) => <String, dynamic>{
      'position': instance.position,
      'name': instance.name,
      'info': instance.info,
      'rank': instance.rank,
      'id': instance.id,
    };
