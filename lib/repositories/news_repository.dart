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
      })
          .map((querySnapshot) {
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
}
