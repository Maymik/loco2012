import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: NewsRoute.page, initial: true),
        AutoRoute(page: CoachesRoute.page),
        AutoRoute(page: ScheduleRoute.page),
        AutoRoute(page: TeamCompositionRoute.page),
        AutoRoute(page: TournamentsRoute.page),
      ];
}
