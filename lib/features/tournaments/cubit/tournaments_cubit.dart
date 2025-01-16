import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/tournaments_repository.dart';
import '../../../utils/service_locator.dart';
import 'tournaments_state.dart';

class TournamentsCubit extends Cubit<TournamentsState> {
  final TournamentsRepository _tournamentsRepository = getIt<TournamentsRepository>();

  TournamentsCubit() : super(const TournamentsState.initial());

  void subscribeToTournaments() {
    emit(const TournamentsState.loading());

    try {
      _tournamentsRepository.getTournaments().listen(
            (tournamentsList) {
          emit(TournamentsState.loaded(tournamentsList));
        },
        onError: (e, stackTrace) {
          emit(TournamentsState.error('Помилка завантаження: ${e.toString()}'));
          print('Помилка в TournamentsCubit: $e\n$stackTrace');
        },
      );
    } catch (e, stackTrace) {
      emit(TournamentsState.error('Критична помилка: ${e.toString()}'));
      print('Критична помилка в subscribeToTournaments: $e\n$stackTrace');
    }
  }
}
