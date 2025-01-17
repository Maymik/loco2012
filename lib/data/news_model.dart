// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class NewsModel {
//   final DateTime time;
//   final String news;
//   final String author;
//   final String id;
//   final List<String> images;
//
//   NewsModel({
//     required this.time,
//     required this.news,
//     required this.author,
//     required this.id,
//     required this.images,
//   });
//
//   factory NewsModel.fromJson(Map<String, dynamic> json, String id) {
//     return NewsModel(
//       time: (json['time'] as Timestamp).toDate(),
//       news: json['news'] as String,
//       author: json['author'] as String,
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
//       'images': images,
//     };
//   }
// }
// import 'package:json_annotation/json_annotation.dart';
//
// part 'news_model.g.dart';
//
// @JsonSerializable()
// class NewsModel {
//   final DateTime time;
//   final String news;
//   final String author;
//   @JsonKey(ignore: true)
//   final String id;
//   final List<String> images;
//
//   NewsModel({
//     required this.time,
//     required this.news,
//     required this.author,
//     required this.id,
//     required this.images,
//   });
//
//   factory NewsModel.fromJson(Map<String, dynamic> json, String id) =>
//       _$NewsModelFromJson(json).copyWith(id: id);
//
//   Map<String, dynamic> toJson() => _$NewsModelToJson(this);
//
//   NewsModel copyWith({String? id}) {
//     return NewsModel(
//       time: time,
//       news: news,
//       author: author,
//       id: id ?? this.id,
//       images: images,
//     );
//   }
// }
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final DateTime time;
  final String news;
  final String author;
 // @JsonKey(ignore: true)
  final String id;
  final List<String> images;

  NewsModel({
    required this.time,
    required this.news,
    required this.author,
    required this.id,
    required this.images,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json, String id) {
    final model = _$NewsModelFromJson(json);
    return model.copyWith(id: id);
  }

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  NewsModel copyWith({
    DateTime? time,
    String? news,
    String? author,
    String? id,
    List<String>? images,
  }) {
    return NewsModel(
      time: time ?? this.time,
      news: news ?? this.news,
      author: author ?? this.author,
      id: id ?? this.id,
      images: images ?? this.images,
    );
  }
}
