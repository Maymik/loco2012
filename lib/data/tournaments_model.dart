class Tournament {
  final DateTime date; 
  final String name;
  final String city;
  final String stadium;

  Tournament({
    required this.date,
    required this.name,
    required this.city,
    required this.stadium,
  });
}


final List<Tournament> tournaments = [
  Tournament(
    date: DateTime(2024, 1, 15),
    name: 'Зимовий Кубок Лева',
    city: 'Львів',
    stadium: 'Стадіон Україна',
  ),
  Tournament(
    date: DateTime(2024, 3, 20),
    name: 'Весняний Турнір Поділля',
    city: 'Вінниця',
    stadium: 'Центральний міський стадіон',
  ),
  Tournament(
    date: DateTime(2024, 6, 10),
    name: 'Літній Чемпіонат Столиці',
    city: 'Київ',
    stadium: 'Стадіон Локомотив',
  ),
];
