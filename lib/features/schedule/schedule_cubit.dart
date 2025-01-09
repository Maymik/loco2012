import 'package:cloud_firestore/cloud_firestore.dart';
import 'schedule_state.dart';
import '../../data/schedule_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(const ScheduleState.initial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
