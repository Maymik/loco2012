// import 'package:auto_route/auto_route.dart';
// import 'package:loco_2012/screens/news_screen.dart';
//
//
// import '../screens/dashboard.dart';
// import 'app_router.gr.dart';
//
// @AutoRouterConfig()
// class AppRouter extends $AppRouter {
//   @override
//   List<AutoRoute> get routes => [
//     AutoRoute(page: DashboardScreen.page, initial: true),
//     AutoRoute(page: NewsScreen.page),
//   ];
// }
import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: DashboardRoute.page, initial: true),
    AutoRoute(page: NewsRoute.page),
  ];
}
