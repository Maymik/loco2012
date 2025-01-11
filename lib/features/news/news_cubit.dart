import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/news_model.dart';
import '../../utils/service_locator.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final FirebaseFirestore _firestore = getIt<FirebaseFirestore>();

  NewsCubit() : super(const NewsState.initial()) {
    subscribeToNews();
  }

  void subscribeToNews() {
    emit(const NewsState.loading());

    _firestore
        .collection('news')
        .orderBy('time', descending: true)
        .snapshots()
        .listen((querySnapshot) {
      final newsList = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return NewsModel.fromJson(data, doc.id);
      }).toList();

      emit(NewsState.loaded(newsList));
    }, onError: (e) {
      emit(NewsState.error('Помилка завантаження: ${e.toString()}'));
    });
  }
}
