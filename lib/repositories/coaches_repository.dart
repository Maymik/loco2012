import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/coaches_model.dart';
import '../../utils/service_locator.dart';

class CoachesRepository {
  final FirebaseFirestore _firestore = getIt<FirebaseFirestore>();

  Stream<List<Coach>> getCoaches() {
    return _firestore
        .collection('coach')
        .orderBy('rank', descending: false)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Coach.fromJson(data, doc.id);
      }).toList();
    });
  }
}
