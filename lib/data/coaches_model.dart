class Coach {
  final String position;
  final String name;
  final String info;
  final String id;

  Coach({
    required this.position,
    required this.name,
    required this.info,
    required this.id,
  });

  factory Coach.fromJson(Map<String, dynamic> json, String documentId) {
    return Coach(
      position: json['position'] ?? 'Невідомо',
      name: json['name'] ?? 'Невідомо',
      info: json['info'] ?? 'Немає інформації',
      id: documentId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'name': name,
      'info': info,
    };
  }
}
