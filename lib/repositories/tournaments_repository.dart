import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/tournaments_model.dart';
import '../../utils/service_locator.dart';

class TournamentsRepository {
  final FirebaseFirestore _firestore = getIt<FirebaseFirestore>();

  Stream<List<Tournament>> getTournaments() {
    return _firestore
        .collection('tournament')
        .orderBy('date', descending: true)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Tournament.fromJson(data, doc.id);
      }).toList();
    });
  }
}
