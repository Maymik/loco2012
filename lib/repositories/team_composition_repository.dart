import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/team_composition_model.dart';
import '../../utils/service_locator.dart';

class TeamCompositionRepository {
  final FirebaseFirestore _firestore = getIt<FirebaseFirestore>();

  Stream<List<TeamPlayer>> getTeamComposition() {
    return _firestore
        .collection('team_player')
        .orderBy('number', descending: false)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return TeamPlayer.fromJson(data, doc.id);
      }).toList();
    });
  }
}
