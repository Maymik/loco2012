import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utils/service_locator.dart';
import 'schedule_state.dart';
import '../../data/schedule_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final FirebaseFirestore _firestore = getIt<FirebaseFirestore>();


  ScheduleCubit() : super(const ScheduleState.initial());


  void subscribeToSchedule() {
    emit(const ScheduleState.loading());

    _firestore
        .collection('schedule')
        .orderBy('id', descending: false)
        .snapshots()
        .listen((querySnapshot) {
      final scheduleList = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Schedule.fromJson(data, doc.id);
      }).toList();

      emit(ScheduleState.loaded(scheduleList));
    }, onError: (e) {
      emit(ScheduleState.error('Помилка завантаження: ${e.toString()}'));
    });
  }
}
