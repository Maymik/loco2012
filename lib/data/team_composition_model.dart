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
    return TeamPlayer(
      number: json['number'] ?? 0,
      name: json['name'] ?? 'Невідомо',
      position: json['position'] ?? 'Невідомо',
      id: documentId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
      'position': position,
    };
  }
}
