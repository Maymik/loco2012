import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/coaches_repository.dart';
import 'coaches_state.dart';
import '../../utils/service_locator.dart';

class CoachesCubit extends Cubit<CoachesState> {
  final CoachesRepository _coachesRepository = getIt<CoachesRepository>();

  CoachesCubit() : super(const CoachesState.initial());

  void subscribeCoaches() async {
    emit(const CoachesState.loading());

    _coachesRepository.getCoaches().listen((coachesList) {
      emit(CoachesState.loaded(coachesList));
    }, onError: (e) {
      emit(CoachesState.error('Помилка завантаження: ${e.toString()}'));
    });
  }
}
