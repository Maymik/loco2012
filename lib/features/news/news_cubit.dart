import 'package:flutter_bloc/flutter_bloc.dart';
import 'news_state.dart';
import '../../data/news_model.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(const NewsState.initial());

  void loadNews() async {
    emit(const NewsState.loading());

    try {
      await Future.delayed(const Duration(seconds: 2));

      final newsList = [
        NewsModel(
          time: DateTime.now(),
          news:
              "ФК Локомотив Київ здобув впевнену перемогу в останньому матчі сезону.",
          author: "Андрій Коваленко",
          id: '1',
        ),
        NewsModel(
          time: DateTime.now().subtract(const Duration(hours: 1)),
          news: "Команда розпочала підготовку до нового сезону на базі клубу.",
          author: "Марія Полякова",
          id: '2',
        ),
        NewsModel(
          time: DateTime.now().subtract(const Duration(hours: 2)),
          news: "Головний тренер відзначив прогрес молодих гравців академії.",
          author: "Сергій Іванов",
          id: '3',
        ),
        NewsModel(
          time: DateTime.now().subtract(const Duration(hours: 3)),
          news:
              "Вболівальники ФК Локомотив зібрали кошти на реконструкцію стадіону.",
          author: "Анна Шевченко",
          id: '4',
        ),
        NewsModel(
          time: DateTime.now().subtract(const Duration(hours: 4)),
          news: "Матч між ФК Локомотив Київ та Динамо завершився внічию.",
          author: "Ігор Мельник",
          id: '5',
        ),
        NewsModel(
          time: DateTime.now().subtract(const Duration(hours: 5)),
          news: "Клуб підписав нового нападника з молодіжної ліги.",
          author: "Олена Кравченко",
          id: '6',
        ),
        NewsModel(
          time: DateTime.now().subtract(const Duration(hours: 6)),
          news: "ФК Локомотив презентував новий комплект форми на сезон.",
          author: "Наталія Гончарова",
          id: '7',
        ),
        NewsModel(
          time: DateTime.now().subtract(const Duration(hours: 7)),
          news: "Капітан команди пообіцяв поборотися за перше місце в лізі.",
          author: "Дмитро Смирнов",
          id: '8',
        ),
        NewsModel(
          time: DateTime.now().subtract(const Duration(hours: 8)),
          news:
              "На тренуванні команди були присутні представники національної збірної.",
          author: "Віктор Левченко",
          id: '9',
        ),
        NewsModel(
          time: DateTime.now().subtract(const Duration(hours: 9)),
          news: "ФК Локомотив планує участь у благодійному матчі.",
          author: "Оксана Руденко",
          id: '10',
        ),
      ];

      emit(NewsState.loaded(newsList));
    } catch (e) {
      emit(const NewsState.error('Не вдалося завантажити'));
    }
  }
}
