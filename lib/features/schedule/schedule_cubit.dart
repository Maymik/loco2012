import 'package:cloud_firestore/cloud_firestore.dart';
import 'schedule_state.dart';
import '../../data/schedule_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(const ScheduleState.initial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void loadSchedule() async {
    emit(const ScheduleState.loading());

    try {
      final querySnapshot =
          await _firestore.collection('schedule').orderBy('day').get();

      final scheduleList = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Schedule.fromJson(data, doc.id);
      }).toList();

      emit(ScheduleState.loaded(scheduleList));
    } catch (e) {
      emit(ScheduleState.error('Помилка завантаження: ${e.toString()}'));
    }
  }
}
