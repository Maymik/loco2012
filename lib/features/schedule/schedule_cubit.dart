import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/schedule_model.dart';

class ScheduleCubit extends Cubit<List<Schedule>> {
  ScheduleCubit() : super([]);

  void loadSchedule() {
    final  scheduleList = [
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
    emit(scheduleList);
  }
}
