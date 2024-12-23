
class TeamPlayer {
  final int number;
  final String name;
  final String position;

  TeamPlayer({
    required this.number,
    required this.name,
    required this.position,
  });

  // factory TeamPlayer.fromJson(Map<String, dynamic> json) {
  //   return TeamPlayer(
  //     number: json['number'] as Int,
  //     name: json['name'] as String,
  //     position: json['position'] as String,
  //   );
  // }
  // Map<String, dynamic> toJson() {
  //   return {
  //     'position': position,
  //     'name': name,
  //     'info': info,
  //   };
  // }
}


final List<TeamPlayer> teamPlayers = [
  TeamPlayer(number: 1, name: 'John Smith', position: 'Goalkeeper'),
  TeamPlayer(number: 2, name: 'Alex Johnson', position: 'Defender'),
  TeamPlayer(number: 3, name: 'Michael Brown', position: 'Defender'),
  TeamPlayer(number: 4, name: 'Chris Davis', position: 'Midfielder'),
  TeamPlayer(number: 5, name: 'James Wilson', position: 'Defender'),
  TeamPlayer(number: 6, name: 'David Garcia', position: 'Midfielder'),
  TeamPlayer(number: 7, name: 'Daniel Martinez', position: 'Forward'),
  TeamPlayer(number: 8, name: 'Matthew Rodriguez', position: 'Midfielder'),
  TeamPlayer(number: 9, name: 'Anthony Hernandez', position: 'Forward'),
  TeamPlayer(number: 10, name: 'Andrew Moore', position: 'Forward'),
  TeamPlayer(number: 11, name: 'Joshua Taylor', position: 'Midfielder'),
  TeamPlayer(number: 12, name: 'Ryan Anderson', position: 'Defender'),
  TeamPlayer(number: 13, name: 'Jason Thomas', position: 'Defender'),
  TeamPlayer(number: 14, name: 'Brandon Jackson', position: 'Midfielder'),
  TeamPlayer(number: 15, name: 'Kevin White', position: 'Defender'),
  TeamPlayer(number: 16, name: 'Jacob Harris', position: 'Midfielder'),
  TeamPlayer(number: 17, name: 'Ethan Martin', position: 'Forward'),
  TeamPlayer(number: 18, name: 'Justin Thompson', position: 'Defender'),
  TeamPlayer(number: 19, name: 'Aaron Martinez', position: 'Midfielder'),
  TeamPlayer(number: 20, name: 'Austin Robinson', position: 'Forward'),
];
