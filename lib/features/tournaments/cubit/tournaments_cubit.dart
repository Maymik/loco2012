import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/tournaments_repository.dart';
import '../../../utils/service_locator.dart';
import 'tournaments_state.dart';

class TournamentsCubit extends Cubit<TournamentsState> {
  final TournamentsRepository _tournamentsRepository = getIt<TournamentsRepository>();

  TournamentsCubit() : super(const TournamentsState.initial());

  void subscribeToTournaments() {
    emit(const TournamentsState.loading());

    _tournamentsRepository.getTournaments().listen((tournamentsList) {
      emit(TournamentsState.loaded(tournamentsList));
    }, onError: (e) {
      emit(TournamentsState.error('Помилка завантаження: ${e.toString()}'));
    });
  }
}
