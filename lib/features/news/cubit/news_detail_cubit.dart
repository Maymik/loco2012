import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/news_repository.dart';
import '../../../utils/service_locator.dart';
import 'news_state.dart';

class NewsDetailCubit extends Cubit<NewsState> {
  final NewsRepository _newsRepository = getIt<NewsRepository>();

  NewsDetailCubit() : super(const NewsState.initial());

  Future<void> fetchNewsById(String newsId) async {
    emit(const NewsState.loading());

    try {
      final news = await _newsRepository.getNewsById(newsId);
      if (news != null) {
        emit(NewsState.loaded([news]));
      } else {
        emit(const NewsState.error('Новину не знайдено'));
      }
    } catch (e) {
      emit(NewsState.error('Помилка завантаження: ${e.toString()}'));
    }
  }
}
