class Coach {
  final String position;
  final String name;
  final String info;
  final String id;

  Coach({
    required this.position,
    required this.name,
    required this.info,
    required this.id,
  });
}
//   factory Coach.fromJson(Map<String, dynamic> json) {
//     return Coach(
//         position: json['position'] as String,
//         name: json['name'] as String,
//         info: json['info'] as String,
//         id: json['id'] as String);
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'position': position,
//       'name': name,
//       'info': info,
//       'id': id,
//     };
//   }
// }
//
// final List<Coach> coaches = [
//   Coach(
//       position: 'Головний тренер',
//       name: 'Іван Іванов',
//       info: 'Має багаторічний досвід роботи з провідними командами.',
//       id: 'Головний тренер Іван Іванов id'),
//   Coach(
//       position: 'Асистент',
//       name: 'Петро Петров',
//       info: 'Відповідає за розробку тактики та стратегії.',
//       id: 'Асистент Петро Петров id'),
//   Coach(
//       position: 'Тренер воротарів',
//       name: 'Сергій Сергієнко',
//       info: 'Спеціаліст з тренувань воротарів із багаторічним стажем.',
//       id: 'Тренер воротарів Сергій Сергієнко id'),
// ];
