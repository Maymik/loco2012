import 'package:json_annotation/json_annotation.dart';

part 'team_composition_model.g.dart';

@JsonSerializable()
class TeamPlayer {
  final int number;
  final String name;
  final String position;
  final String id;

  TeamPlayer({
    required this.number,
    required this.name,
    required this.position,
    required this.id,
  });

  factory TeamPlayer.fromJson(Map<String, dynamic> json, String documentId) {
    final model = _$TeamPlayerFromJson(json);
    return model.copyWith(id: documentId);
  }

  Map<String, dynamic> toJson() => _$TeamPlayerToJson(this);

  TeamPlayer copyWith({
    int? number,
    String? name,
    String? position,
    String? id,
  }) {
    return TeamPlayer(
      number: number ?? this.number,
      name: name ?? this.name,
      position: position ?? this.position,
      id: id ?? this.id,
    );
  }
}
