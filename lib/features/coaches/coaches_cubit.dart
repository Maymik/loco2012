import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/coaches_model.dart';
import 'coaches_state.dart';

class CoachesCubit extends Cubit<CoachesState> {
  CoachesCubit() : super(const CoachesState.initial());

  void loadCoaches() async {
    emit(const CoachesState.loading());

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('coach').get();

      final coaches = querySnapshot.docs.map((doc) {
        return Coach.fromJson(doc.data(), doc.id);
      }).toList();

      emit(CoachesState.loaded(coaches));
    } catch (e) {
      emit(const CoachesState.error('Не вдалося завантажити тренерів'));
    }
  }
}
