import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/coaches_model.dart';

class CoachesCubit extends Cubit<List<Coach>> {
  CoachesCubit() : super([]);

  void loadCoaches() {
    final coaches = [
      Coach(
          position: 'Головний тренер',
          name: 'Іван Іванов',
          info: 'Має багаторічний досвід роботи з провідними командами.',
          id: 'Головний тренер Іван Іванов id'),
      Coach(
          position: 'Асистент',
          name: 'Петро Петров',
          info: 'Відповідає за розробку тактики та стратегії.',
          id: 'Асистент Петро Петров id'),
      Coach(
          position: 'Тренер воротарів',
          name: 'Сергій Сергієнко',
          info: 'Спеціаліст з тренувань воротарів із багаторічним стажем.',
          id: 'Тренер воротарів Сергій Сергієнко id'),
    ];
    emit(coaches);
  }
}
