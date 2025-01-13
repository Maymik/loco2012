import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/schedule_model.dart';
import '../../utils/service_locator.dart';

class ScheduleRepository {
  final FirebaseFirestore _firestore = getIt<FirebaseFirestore>();

  Stream<List<Schedule>> getSchedule() {
    return _firestore
        .collection('schedule')
        .orderBy('id', descending: false)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Schedule.fromJson(data, doc.id);
      }).toList();
    });
  }
}
