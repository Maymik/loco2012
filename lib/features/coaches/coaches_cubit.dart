import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/coaches_model.dart';
import '../../utils/service_locator.dart';
import 'coaches_state.dart';

class CoachesCubit extends Cubit<CoachesState> {
  final FirebaseFirestore _firestore = getIt<FirebaseFirestore>();

  CoachesCubit() : super(const CoachesState.initial());


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
