// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_composition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamPlayer _$TeamPlayerFromJson(Map<String, dynamic> json) => TeamPlayer(
      number: (json['number'] as num).toInt(),
      name: json['name'] as String,
      position: json['position'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$TeamPlayerToJson(TeamPlayer instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'position': instance.position,
      'id': instance.id,
    };
