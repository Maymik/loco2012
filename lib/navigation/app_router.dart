import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: AuthGuardRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/home',
          page: MainContentRoute.page,
        ),
        AutoRoute(page: NewsRoute.page, path: '/news'),
        AutoRoute(page: NewsDetailRoute.page, path: '/newsDetail/:newsId'),
        AutoRoute(page: CoachesRoute.page),
        AutoRoute(page: ScheduleRoute.page),
        AutoRoute(page: TeamCompositionRoute.page),
        AutoRoute(page: TournamentsRoute.page),
        AutoRoute(page: CreateNewsRoute.page),
      ];
}
