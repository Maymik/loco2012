import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/schedule_repository.dart';
import '../../../utils/service_locator.dart';
import 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final ScheduleRepository _scheduleRepository = getIt<ScheduleRepository>();

  ScheduleCubit() : super(const ScheduleState.initial());

  void subscribeToSchedule() {
    emit(const ScheduleState.loading());

    try {
      _scheduleRepository.getSchedule().listen(
            (scheduleList) {
          emit(ScheduleState.loaded(scheduleList));
        },
        onError: (e, stackTrace) {
          emit(ScheduleState.error('Помилка завантаження: ${e.toString()}'));
          print('Помилка в ScheduleCubit: $e\n$stackTrace');
        },
      );
    } catch (e, stackTrace) {
      emit(ScheduleState.error('Критична помилка: ${e.toString()}'));
      print('Критична помилка в subscribeToSchedule: $e\n$stackTrace');
    }
  }
}
