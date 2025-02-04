// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:loco_2012/features/coaches/ui/coaches_screen.dart' as _i1;
import 'package:loco_2012/features/news/ui/news_screen.dart' as _i2;
import 'package:loco_2012/features/schedule/ui/schedule_screen.dart' as _i3;
import 'package:loco_2012/features/team_composition/ui/team_composition_screen.dart'
    as _i4;
import 'package:loco_2012/features/tournaments/ui/tournaments_screen.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CoachesRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CoachesScreen(),
      );
    },
    NewsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.NewsScreen(),
      );
    },
    ScheduleRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ScheduleScreen(),
      );
    },
    TeamCompositionRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TeamCompositionScreen(),
      );
    },
    TournamentsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TournamentsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CoachesScreen]
class CoachesRoute extends _i6.PageRouteInfo<void> {
  const CoachesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CoachesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoachesRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.NewsScreen]
class NewsRoute extends _i6.PageRouteInfo<void> {
  const NewsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ScheduleScreen]
class ScheduleRoute extends _i6.PageRouteInfo<void> {
  const ScheduleRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TeamCompositionScreen]
class TeamCompositionRoute extends _i6.PageRouteInfo<void> {
  const TeamCompositionRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TeamCompositionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeamCompositionRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TournamentsScreen]
class TournamentsRoute extends _i6.PageRouteInfo<void> {
  const TournamentsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TournamentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TournamentsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
