import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/coaches_repository.dart';
import '../../../utils/service_locator.dart';
import 'coaches_state.dart';

class CoachesCubit extends Cubit<CoachesState> {
  final CoachesRepository _coachesRepository = getIt<CoachesRepository>();

  CoachesCubit() : super(const CoachesState.initial());

  void subscribeCoaches() async {
    emit(const CoachesState.loading());

    try {
      await Future.delayed(Duration.zero);

      _coachesRepository.getCoaches().listen(
            (coachesList) {
          emit(CoachesState.loaded(coachesList));
        },
        onError: (e, stackTrace) {
          emit(CoachesState.error('Помилка завантаження: ${e.toString()}'));
        },
      );
    } catch (e, stackTrace) {
      emit(CoachesState.error('Критична помилка : $e\n$stackTrace'));
    }
  }
}
