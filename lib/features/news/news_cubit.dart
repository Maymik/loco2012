import 'package:cloud_firestore/cloud_firestore.dart';
import 'news_state.dart';
import '../../data/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(const NewsState.initial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void loadNews() async {
    emit(const NewsState.loading());

    try {
      final querySnapshot = await _firestore
          .collection('news')
          .orderBy('time', descending: true)
          .get();

      final newsList = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return NewsModel(
          time: (data['time'] as Timestamp).toDate(),
          news: data['news'] as String,
          author: data['author'] as String,
          id: doc.id,
        );
      }).toList();

      emit(NewsState.loaded(newsList));
    } catch (e) {
      emit(NewsState.error('Ошибка загрузки: ${e.toString()}'));
    }
  }
}
