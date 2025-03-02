// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../repositories/news_repository.dart';
// import '../../../utils/service_locator.dart';
// import 'news_state.dart';
//
// class NewsCubit extends Cubit<NewsState> {
//   final NewsRepository _newsRepository = getIt<NewsRepository>();
//
//   NewsCubit() : super(const NewsState.initial()) {
//     subscribeToNews();
//   }
//
//   void subscribeToNews() {
//     emit(const NewsState.loading());
//
//     try {
//       _newsRepository.getNews().listen(
//             (newsList) {
//           emit(NewsState.loaded(newsList));
//         },
//         onError: (e, stackTrace) {
//           emit(NewsState.error('Помилка завантаження: $e\n$stackTrace'));
//         },
//       );
//     } catch (e, stackTrace) {
//       emit(NewsState.error('Критична помилка: $e\n$stackTrace'));
//     }
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/news_model.dart';
import '../../../repositories/news_repository.dart';
import '../../../utils/service_locator.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _newsRepository = getIt<NewsRepository>();

  NewsCubit() : super(const NewsState.initial()) {
    subscribeToNews();
  }

  void subscribeToNews() {
    emit(const NewsState.loading());

    try {
      _newsRepository.getNews().listen(
            (newsList) {
          emit(NewsState.loaded(newsList));
        },
        onError: (e, stackTrace) {
          emit(NewsState.error('Помилка завантаження: $e\n$stackTrace'));
        },
      );
    } catch (e, stackTrace) {
      emit(NewsState.error('Критична помилка: $e\n$stackTrace'));
    }
  }

  Future<void> createNews(NewsModel news) async {
    emit(const NewsState.loading());

    try {
      await _newsRepository.createNews(news);
      emit(const NewsState.initial());
    } catch (e) {
      emit(NewsState.error('Помилка створення новини: $e'));
    }
  }
}
