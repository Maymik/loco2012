import 'package:auto_route/auto_route.dart';

import '../navigation/app_router.gr.dart';

class AppConstants {
  static const List<PageRouteInfo> routes = [
    NewsRoute(),
    ScheduleRoute(),
    TeamCompositionRoute(),
    CoachesRoute(),
    TournamentsRoute(),
  ];

  static const String tournaments = "Наступні турніри";
  static const String coaches = "Тренери";
  static const String news = "Останні новини";
  static const String schedule = "Розклад на тиждень";
  static const String teamComposition = "Склади команд";
}
