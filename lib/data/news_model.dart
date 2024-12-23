class NewsModel {
  final DateTime time;
  final String news;
  final String author;

  NewsModel({
    required this.time,
    required this.news,
    required this.author,
  });

  @override
  String toString() {
    return 'NewsModel(time: $time, news: $news, author: $author)';
  }
}

final List<NewsModel> newsList = [
  NewsModel(
    time: DateTime.now(),
    news: "ФК Локомотив Київ здобув впевнену перемогу в останньому матчі сезону.",
    author: "Андрій Коваленко",
  ),
  NewsModel(
    time: DateTime.now().subtract(const Duration(hours: 1)),
    news: "Команда розпочала підготовку до нового сезону на базі клубу.",
    author: "Марія Полякова",
  ),
  NewsModel(
    time: DateTime.now().subtract(const Duration(hours: 2)),
    news: "Головний тренер відзначив прогрес молодих гравців академії.",
    author: "Сергій Іванов",
  ),
  NewsModel(
    time: DateTime.now().subtract(const Duration(hours: 3)),
    news: "Вболівальники ФК Локомотив зібрали кошти на реконструкцію стадіону.",
    author: "Анна Шевченко",
  ),
  NewsModel(
    time: DateTime.now().subtract(const Duration(hours: 4)),
    news: "Матч між ФК Локомотив Київ та Динамо завершився внічию.",
    author: "Ігор Мельник",
  ),
  NewsModel(
    time: DateTime.now().subtract(const Duration(hours: 5)),
    news: "Клуб підписав нового нападника з молодіжної ліги.",
    author: "Олена Кравченко",
  ),
  NewsModel(
    time: DateTime.now().subtract(const Duration(hours: 6)),
    news: "ФК Локомотив презентував новий комплект форми на сезон.",
    author: "Наталія Гончарова",
  ),
  NewsModel(
    time: DateTime.now().subtract(const Duration(hours: 7)),
    news: "Капітан команди пообіцяв поборотися за перше місце в лізі.",
    author: "Дмитро Смирнов",
  ),
  NewsModel(
    time: DateTime.now().subtract(const Duration(hours: 8)),
    news: "На тренуванні команди були присутні представники національної збірної.",
    author: "Віктор Левченко",
  ),
  NewsModel(
    time: DateTime.now().subtract(const Duration(hours: 9)),
    news: "ФК Локомотив планує участь у благодійному матчі.",
    author: "Оксана Руденко",
  ),
];
