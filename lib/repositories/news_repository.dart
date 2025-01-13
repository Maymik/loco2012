import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/news_model.dart';
import '../../utils/service_locator.dart';

class NewsRepository {
  final FirebaseFirestore _firestore = getIt<FirebaseFirestore>();

  Stream<List<NewsModel>> getNews() {
    return _firestore
        .collection('news')
        .orderBy('time', descending: true)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return NewsModel.fromJson(data, doc.id);
      }).toList();
    });
  }
}
