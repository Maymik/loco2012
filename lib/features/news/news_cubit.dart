import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/news_repository.dart';
import '../../utils/service_locator.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _newsRepository = getIt<NewsRepository>();

  NewsCubit() : super(const NewsState.initial()) {
    subscribeToNews();
  }

  void subscribeToNews() {
    emit(const NewsState.loading());

    _newsRepository.getNews().listen((newsList) {
      emit(NewsState.loaded(newsList));
    }, onError: (e) {
      emit(NewsState.error('Помилка завантаження: ${e.toString()}'));
    });
  }
}
