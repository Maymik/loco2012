import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../repositories/coaches_repository.dart';
import '../repositories/news_repository.dart';
import '../repositories/schedule_repository.dart';
import '../repositories/team_composition_repository.dart';
import '../repositories/tournaments_repository.dart';


final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<NewsRepository>(NewsRepository());
  getIt.registerSingleton<ScheduleRepository>(ScheduleRepository());
  getIt.registerSingleton<TeamCompositionRepository>(TeamCompositionRepository());
  getIt.registerSingleton<CoachesRepository>(CoachesRepository());
  getIt.registerSingleton<TournamentsRepository>(TournamentsRepository());
}
