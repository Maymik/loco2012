import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/schedule_repository.dart';
import '../../utils/service_locator.dart';
import 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final ScheduleRepository _scheduleRepository = getIt<ScheduleRepository>();

  ScheduleCubit() : super(const ScheduleState.initial());

  void subscribeToSchedule() {
    emit(const ScheduleState.loading());

    _scheduleRepository.getSchedule().listen((scheduleList) {
      emit(ScheduleState.loaded(scheduleList));
    }, onError: (e) {
      emit(ScheduleState.error('Помилка завантаження: ${e.toString()}'));
    });
  }
}
