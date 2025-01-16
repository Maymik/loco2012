import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/coaches_repository.dart';
import 'coaches_state.dart';
import '../../../utils/service_locator.dart';

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
          print('Помилка в CoachesCubit: $e\n$stackTrace');
        },
      );
    } catch (e, stackTrace) {
      emit(CoachesState.error('Критична помилка : ${e.toString()}'));
      print('Критична помилка в subscribeCoaches: $e\n$stackTrace');
    }
  }
}
