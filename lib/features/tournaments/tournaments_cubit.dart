import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/tournaments_model.dart';
import 'tournaments_state.dart';

class TournamentsCubit extends Cubit<TournamentsState> {
  TournamentsCubit() : super(const TournamentsState.initial());

  void loadTournaments() async {
    emit(const TournamentsState.loading());

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('tournament').get();

      final tournaments = querySnapshot.docs.map((doc) {
        return Tournament.fromJson(doc.data(), doc.id);
      }).toList();

      emit(TournamentsState.loaded(tournaments));
    } catch (e) {
      emit(const TournamentsState.error('Не вдалося завантажити турніри'));
    }
  }
}
