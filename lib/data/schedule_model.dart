class Schedule {
  final String day;
  final String time;
  final String location;
  final String id;

  Schedule({
    required this.day,
    required this.time,
    required this.location,
    required this.id,
  });

  factory Schedule.fromJson(Map<String, dynamic> json, String id) {
    return Schedule(
      day: json['day'] as String,
      time: json['time'] as String,
      location: json['location'] as String,
      id: id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'time': time,
      'location': location,
    };
  }
}
