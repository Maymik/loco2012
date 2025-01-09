import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/team_composition_model.dart';
import '../../utils/service_locator.dart';
import 'team_composition_state.dart';

class TeamCompositionCubit extends Cubit<TeamCompositionState> {
  final FirebaseFirestore _firestore = getIt<FirebaseFirestore>();

  TeamCompositionCubit() : super(const TeamCompositionState.initial());

  void subscribeTeamComposition() async {
    emit(const TeamCompositionState.loading());


    _firestore
        .collection('team_player')
        .orderBy('number', descending: false)
        .snapshots()
        .listen((querySnapshot) {
      final newsList = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return TeamPlayer.fromJson(data, doc.id);
      }).toList();

      emit(TeamCompositionState.loaded(newsList));
    }, onError: (e) {
      emit(TeamCompositionState.error('Помилка завантаження: ${e.toString()}'));
    });
  }
}
