import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/news_repository.dart';
import '../../../utils/service_locator.dart';
import 'news_state.dart';

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
//           emit(NewsState.error('Помилка завантаження: ${e.toString()}'));
//           print('Помилка в NewsCubit: $e\n$stackTrace');
//         },
//       );
//     } catch (e, stackTrace) {
//       emit(NewsState.error('Критична помилка: ${e.toString()}'));
//       print('Критична помилка в subscribeToNews: $e\n$stackTrace');
//     }
//   }
// }
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
          emit(NewsState.error('Помилка завантаження: ${e.toString()}'));
          print('Помилка в NewsCubit: $e\n$stackTrace');
        },
      );
    } catch (e, stackTrace) {
      emit(NewsState.error('Критична помилка: ${e.toString()}'));
      print('Критична помилка в subscribeToNews: $e\n$stackTrace');
    }
  }

// Future<void> fetchNewsById(String newsId) async {
//   emit(const NewsState.loading());
//
//   try {
//     final news = await _newsRepository.getNewsById(newsId);
//     if (news != null) {
//       emit(NewsState.loaded([news]));
//     } else {
//       emit(const NewsState.error('Новину не знайдено'));
//     }
//   } catch (e) {
//     emit(NewsState.error('Помилка завантаження: ${e.toString()}'));
//   }
// }
}
