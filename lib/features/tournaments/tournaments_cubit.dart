import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/tournaments_model.dart';
import '../../utils/service_locator.dart';
import 'tournaments_state.dart';

class TournamentsCubit extends Cubit<TournamentsState> {
  final FirebaseFirestore _firestore = getIt<FirebaseFirestore>();

  TournamentsCubit() : super(const TournamentsState.initial());

  void subscribeToTournaments() {
    emit(const TournamentsState.loading());


    _firestore
        .collection('tournament')
        .orderBy('date', descending: true)
        .snapshots()
        .listen((querySnapshot) {
      final newsList = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Tournament.fromJson(data, doc.id);
      }).toList();

      emit(TournamentsState.loaded(newsList));
    }, onError: (e) {
      emit(TournamentsState.error('Помилка завантаження: ${e.toString()}'));
    });
  }
}
