import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/team_composition_repository.dart';
import '../../../utils/service_locator.dart';
import 'team_composition_state.dart';

class TeamCompositionCubit extends Cubit<TeamCompositionState> {
  final TeamCompositionRepository _teamCompositionRepository = getIt<TeamCompositionRepository>();

  TeamCompositionCubit() : super(const TeamCompositionState.initial());

  void subscribeTeamComposition() {
    emit(const TeamCompositionState.loading());

    try {
      _teamCompositionRepository.getTeamComposition().listen(
            (teamList) {
          emit(TeamCompositionState.loaded(teamList));
        },
        onError: (e, stackTrace) {
          emit(TeamCompositionState.error(
              'Помилка завантаження: $e\n$stackTrace'));
        },
      );
    } catch (e, stackTrace) {
      emit(TeamCompositionState.error('Критична помилка: $e\n$stackTrace'));
    }
  }
}
