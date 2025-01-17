import 'package:json_annotation/json_annotation.dart';

part 'coaches_model.g.dart';

@JsonSerializable()
class Coach {
  final String position;
  final String name;
  final String info;
  final String rank;
  final String id;

  Coach({
    required this.position,
    required this.name,
    required this.info,
    required this.rank,
    this.id = '',
  });

  factory Coach.fromJson(Map<String, dynamic> json, String documentId) => _$CoachFromJson(json).copyWith(id: documentId);

  Map<String, dynamic> toJson() => _$CoachToJson(this);

  Coach copyWith({String? id}) {
    return Coach(
      position: position,
      name: name,
      info: info,
      rank: rank,
      id: id ?? this.id,
    );
  }
}
