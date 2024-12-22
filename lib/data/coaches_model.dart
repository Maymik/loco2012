class Coach {
  final String position;
  final String name;
  final String info;

  Coach({
    required this.position,
    required this.name,
    required this.info,
  });

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      position: json['position'] as String,
      name: json['name'] as String,
      info: json['info'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'name': name,
      'info': info,
    };
  }
}

final List<Coach> coaches = [
  Coach(
    position: 'Главный тренер',
    name: 'Иван Иванов',
    info: 'Имеет многолетний опыт работы с ведущими командами.',
  ),
  Coach(
    position: 'Ассистент',
    name: 'Петр Петров',
    info: 'Отвечает за разработку тактики и стратегий.',
  ),
  Coach(
    position: 'Тренер вратарей',
    name: 'Сергей Сергеев',
    info: 'Специалист по тренировкам вратарей с многолетним стажем.',
  ),
];
