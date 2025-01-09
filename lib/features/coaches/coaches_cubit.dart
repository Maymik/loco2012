import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/coaches_model.dart';
import 'coaches_state.dart';

class CoachesCubit extends Cubit<CoachesState> {
  CoachesCubit() : super(const CoachesState.initial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void subscribeCoaches() async {
    emit(const CoachesState.loading());

    _firestore
        .collection('coach')
        .orderBy('id', descending: false)
        .snapshots()
        .listen((querySnapshot) {
      final newsList = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Coach.fromJson(data, doc.id);
      }).toList();

      emit(CoachesState.loaded(newsList));
    }, onError: (e) {
      emit(CoachesState.error('Помилка завантаження: ${e.toString()}'));
    });
  }
}
