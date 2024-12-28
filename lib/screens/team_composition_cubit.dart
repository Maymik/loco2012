import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/team_composition_model.dart';

class TeamCompositionCubit extends Cubit<List<TeamPlayer>> {
  TeamCompositionCubit() : super([]);

  void loadTeamComposition() {
    final  teamPlayers = [
      TeamPlayer(number: 1, name: 'Джон Сміт', position: 'Воротар', id: '1'),
      TeamPlayer(number: 2, name: 'Олексій Джонсон', position: 'Захисник', id: '2'),
      TeamPlayer(number: 3, name: 'Михайло Браун', position: 'Захисник', id: '3'),
      TeamPlayer(number: 4, name: 'Кріс Девіс', position: 'Півзахисник', id: '4'),
      TeamPlayer(number: 5, name: 'Джеймс Вілсон', position: 'Захисник', id: '5'),
      TeamPlayer(number: 6, name: 'Давид Гарсія', position: 'Півзахисник', id: '6'),
      TeamPlayer(
          number: 7, name: 'Даніель Мартінес', position: 'Нападник', id: '7'),
      TeamPlayer(number: 8, name: 'Марк Козирев', position: 'Півзахисник', id: '8'),
      TeamPlayer(
          number: 9, name: 'Антоніо Ернандес', position: 'Нападник', id: '9'),
      TeamPlayer(number: 10, name: 'Андрій Мур', position: 'Нападник', id: '10'),
      TeamPlayer(
          number: 11, name: 'Йосип Тейлор', position: 'Півзахисник', id: '11'),
      TeamPlayer(
          number: 12, name: 'Райан Андерсон', position: 'Захисник', id: '12'),
      TeamPlayer(number: 13, name: 'Джейсон Томас', position: 'Захисник', id: '13'),
      TeamPlayer(
          number: 14, name: 'Брендон Джексон', position: 'Півзахисник', id: '14'),
      TeamPlayer(number: 15, name: 'Кевін Вайт', position: 'Захисник', id: '15'),
      TeamPlayer(
          number: 16, name: 'Яків Харріс', position: 'Півзахисник', id: '16'),
      TeamPlayer(number: 17, name: 'Етан Мартін', position: 'Нападник', id: '17'),
      TeamPlayer(
          number: 18, name: 'Джастін Томпсон', position: 'Захисник', id: '18'),
      TeamPlayer(
          number: 19, name: 'Аарон Мартінес', position: 'Півзахисник', id: '19'),
      TeamPlayer(
          number: 20, name: 'Остін Робінсон', position: 'Нападник', id: '20'),
    ];
    emit(teamPlayers);
  }
}
