import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/team_composition_model.dart';
import 'team_composition_state.dart';

class TeamCompositionCubit extends Cubit<TeamCompositionState> {
  TeamCompositionCubit() : super(const TeamCompositionState.initial());

  void loadTeamComposition() async {
    emit(const TeamCompositionState.loading());

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('team_player').get();

      final teamPlayers = querySnapshot.docs.map((doc) {
        return TeamPlayer.fromJson(doc.data(), doc.id);
      }).toList();

      emit(TeamCompositionState.loaded(teamPlayers));
    } catch (e) {
      emit(const TeamCompositionState.error(
          'Не вдалося завантажити склад команди'));
    }
  }
}
