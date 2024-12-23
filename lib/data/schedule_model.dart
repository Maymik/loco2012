class Schedule {
  final String day;
  final String time;
  final String location;

  Schedule({
    required this.day,
    required this.time,
    required this.location,
  });
}

final List<Schedule> scheduleList = [
  Schedule(
    day: 'Понеділок',
    time: '16:30',
    location: 'Стадіон Локомотив',
  ),
  Schedule(
    day: 'Середа',
    time: '16:30',
    location: 'Стадіон Локомотив',
  ),
  Schedule(
    day: 'П’ятниця',
    time: '16:30',
    location: 'Стадіон Локомотив',
  ),
];
