import 'package:json_annotation/json_annotation.dart';

part 'tournaments_model.g.dart';

@JsonSerializable()
class Tournament {
  final DateTime date;
  final String name;
  final String city;
  final String stadium;
  final String id;

  Tournament({
    required this.date,
    required this.name,
    required this.city,
    required this.stadium,
    required this.id,
  });

  factory Tournament.fromJson(Map<String, dynamic> json, String documentId) {
    final model = _$TournamentFromJson(json);
    return model.copyWith(id: documentId);
  }

  Map<String, dynamic> toJson() => _$TournamentToJson(this);

  Tournament copyWith({
    DateTime? date,
    String? name,
    String? city,
    String? stadium,
    String? id,
  }) {
    return Tournament(
      date: date ?? this.date,
      name: name ?? this.name,
      city: city ?? this.city,
      stadium: stadium ?? this.stadium,
      id: id ?? this.id,
    );
  }
}
