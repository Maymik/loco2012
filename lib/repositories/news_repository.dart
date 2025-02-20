import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/news_model.dart';
import '../../utils/service_locator.dart';

class NewsRepository {
  final FirebaseFirestore _firestore = getIt<FirebaseFirestore>();

  Stream<List<NewsModel>> getNews() {
    try {
      return _firestore
          .collection('news')
          .orderBy('time', descending: true)
          .snapshots()
          .handleError((error) {
        print('Error fetching news: $error');
      }).map((querySnapshot) {
        return querySnapshot.docs.map((doc) {
          final data = doc.data();
          return NewsModel.fromJson(data, doc.id);
        }).toList();
      });
    } catch (e) {
      print('Synchronous error: $e');
      return Stream.error(e);
    }
  }

  Future<NewsModel?> getNewsById(String newsId) async {
    try {
      final doc = await _firestore.collection('news').doc(newsId).get();
      if (doc.exists) {
        return NewsModel.fromJson(doc.data()!, doc.id);
      } else {
        return null;
      }
    } catch (e) {
      print('Помилка при отриманні новини по ID: $e');
      return null;
    }
  }

  Future<void> createNews(NewsModel news) async {
    try {
      await _firestore.collection('news').add(news.toJson());
    } catch (e) {
      print('Помилка при створені новини: $e');
      throw Exception('Не вийшло створити новину');
    }
  }
}
