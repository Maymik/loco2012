import 'package:flutter_bloc/flutter_bloc.dart';
import 'schedule_state.dart';
import '../../data/schedule_model.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(const ScheduleState.initial());

  void loadSchedule() async {
    emit(const ScheduleState.loading());

    try {
      await Future.delayed(const Duration(seconds: 2));

      final scheduleList = [
        Schedule(
          day: 'Понеділок',
          time: '16:30',
          location: 'Стадіон Локомотив',
          id: '1',
        ),
        Schedule(
          day: 'Середа',
          time: '16:30',
          location: 'Стадіон Локомотив',
          id: '2',
        ),
        Schedule(
          day: 'П’ятниця',
          time: '16:30',
          location: 'Стадіон Локомотив',
          id: '3',
        ),
      ];

      emit(ScheduleState.loaded(scheduleList));
    } catch (e) {
      emit(const ScheduleState.error('Не вдалося завантажити'));
    }
  }
}
