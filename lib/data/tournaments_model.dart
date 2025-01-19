import 'package:cloud_firestore/cloud_firestore.dart';

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
    return Tournament(
      date: (json['date'] as Timestamp).toDate(),
      name: json['name'] ?? 'Невідомий турнір',
      city: json['city'] ?? 'Невідомо',
      stadium: json['stadium'] ?? 'Невідомий стадіон',
      id: documentId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'name': name,
      'city': city,
      'stadium': stadium,
    };
  }
}