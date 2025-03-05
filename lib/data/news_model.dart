// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class NewsModel {
//   final DateTime time;
//   final String news;
//   final String author;
//   final String title;
//   final String id;
//   final List<String> images;
//
//   NewsModel({
//     required this.time,
//     required this.news,
//     required this.author,
//     required this.title,
//     required this.id,
//     required this.images,
//   });
//
//   factory NewsModel.fromJson(Map<String, dynamic> json, String id) {
//     return NewsModel(
//       time: (json['time'] as Timestamp).toDate(),
//       news: json['news'] as String,
//       author: json['author'] as String,
//       title: json['title'] as String,
//       id: id,
//       images: (json['images'] as List<dynamic>?)?.map((e) => e as String)
//           .toList() ?? [],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'time': Timestamp.fromDate(time),
//       'news': news,
//       'author': author,
//       'title' : title,
//       'images': images,
//     };
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  final DateTime time;
  final String news;
  final String author;
  final String title;
  final String id;
  final List<String> images;
  final List<String> videos; // Новое поле

  NewsModel({
    required this.time,
    required this.news,
    required this.author,
    required this.title,
    required this.id,
    required this.images,
    required this.videos,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json, String id) {
    return NewsModel(
      time: (json['time'] as Timestamp).toDate(),
      news: json['news'] as String,
      author: json['author'] as String,
      title: json['title'] as String,
      id: id,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': Timestamp.fromDate(time),
      'news': news,
      'author': author,
      'title': title,
      'images': images,
      'videos': videos, // Сохранение видео в Firestore
    };
  }
}
