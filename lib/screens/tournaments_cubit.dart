import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/tournaments_model.dart';

class TournamentsCubit extends Cubit<List<Tournament>> {
  TournamentsCubit() : super([]);

  void loadTournaments() {
    final tournaments = [
      Tournament(
        date: DateTime(2024, 1, 15),
        name: 'Зимовий Кубок Лева',
        city: 'Львів',
        stadium: 'Стадіон Україна',
        id: '1',
      ),
      Tournament(
        date: DateTime(2024, 3, 20),
        name: 'Весняний Турнір Поділля',
        city: 'Вінниця',
        stadium: 'Центральний міський стадіон',
        id: '2',
      ),
      Tournament(
        date: DateTime(2024, 6, 10),
        name: 'Літній Чемпіонат Столиці',
        city: 'Київ',
        stadium: 'Стадіон Локомотив',
        id: '3',
      ),
    ];
    emit(tournaments);
  }
}
