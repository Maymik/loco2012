// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../data/coaches_model.dart';
// import 'coaches_state.dart';
//
// class CoachesCubit extends Cubit<CoachesState> {
//   CoachesCubit() : super(const CoachesState.initial());
//
//   void loadCoaches() async {
//     emit(const CoachesState.loading());
//
//     try {
//       await Future.delayed(const Duration(seconds: 2));
//
//       final coaches = [
//         Coach(
//           position: 'Головний тренер',
//           name: 'Іван Іванов',
//           info: 'Має багаторічний досвід роботи з провідними командами.',
//           id: 'Головний тренер Іван Іванов id',
//         ),
//         Coach(
//           position: 'Асистент',
//           name: 'Петро Петров',
//           info: 'Відповідає за розробку тактики та стратегії.',
//           id: 'Асистент Петро Петров id',
//         ),
//         Coach(
//           position: 'Тренер воротарів',
//           name: 'Сергій Сергієнко',
//           info: 'Спеціаліст з тренувань воротарів із багаторічним стажем.',
//           id: 'Тренер воротарів Сергій Сергієнко id',
//         ),
//       ];
//
//       emit(CoachesState.loaded(coaches));
//     } catch (e) {
//       emit(const CoachesState.error('Не вдалося завантажити'));
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/coaches_model.dart';
import 'coaches_state.dart';

class CoachesCubit extends Cubit<CoachesState> {
  CoachesCubit() : super(const CoachesState.initial());

  void loadCoaches() async {
    emit(const CoachesState.loading());

    try {
      final querySnapshot = await FirebaseFirestore.instance.collection(
          'coach').get();

      final coaches = querySnapshot.docs.map((doc) {
        return Coach(
          position: doc['position'] ?? 'Невідомо',
          name: doc['name'] ?? 'Невідомо',
          info: doc['info'] ?? 'Немає інформації',
          id: doc.id,
        );
      }).toList();

      emit(CoachesState.loaded(coaches));
    } catch (e) {
      emit(const CoachesState.error('Не вдалося завантажити тренерів'));
    }
  }
}