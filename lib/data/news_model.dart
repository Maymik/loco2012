import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  final DateTime time;
  final String news;
  final String author;
  final String id;

  NewsModel({
    required this.time,
    required this.news,
    required this.author,
    required this.id,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json, String id) {
    return NewsModel(
      time: (json['time'] as Timestamp).toDate(),
      news: json['news'] as String,
      author: json['author'] as String,
      id: id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': Timestamp.fromDate(time),
      'news': news,
      'author': author,
    };
  }
}
