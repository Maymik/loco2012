// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:loco_2012/features/coaches/ui/coaches_screen.dart' as _i2;
import 'package:loco_2012/features/news/ui/create_news_screen.dart' as _i3;
import 'package:loco_2012/features/news/ui/news_detail.dart' as _i5;
import 'package:loco_2012/features/news/ui/news_screen.dart' as _i6;
import 'package:loco_2012/features/schedule/ui/schedule_screen.dart' as _i7;
import 'package:loco_2012/features/team_composition/ui/team_composition_screen.dart'
    as _i8;
import 'package:loco_2012/features/tournaments/ui/tournaments_screen.dart'
    as _i9;
import 'package:loco_2012/main_content.dart' as _i4;
import 'package:loco_2012/navigation/auth_guard_route.dart' as _i1;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AuthGuardRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthGuardScreen(),
      );
    },
    CoachesRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CoachesScreen(),
      );
    },
    CreateNewsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CreateNewsScreen(),
      );
    },
    MainContentRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainContent(),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.NewsDetailScreen(
          key: args.key,
          newsId: args.newsId,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.NewsScreen(),
      );
    },
    ScheduleRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ScheduleScreen(),
      );
    },
    TeamCompositionRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.TeamCompositionScreen(),
      );
    },
    TournamentsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.TournamentsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthGuardScreen]
class AuthGuardRoute extends _i10.PageRouteInfo<void> {
  const AuthGuardRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AuthGuardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthGuardRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CoachesScreen]
class CoachesRoute extends _i10.PageRouteInfo<void> {
  const CoachesRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CoachesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoachesRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CreateNewsScreen]
class CreateNewsRoute extends _i10.PageRouteInfo<void> {
  const CreateNewsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CreateNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateNewsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainContent]
class MainContentRoute extends _i10.PageRouteInfo<void> {
  const MainContentRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MainContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainContentRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NewsDetailScreen]
class NewsDetailRoute extends _i10.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i11.Key? key,
    required String newsId,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            newsId: newsId,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const _i10.PageInfo<NewsDetailRouteArgs> page =
      _i10.PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i11.Key? key;

  final String newsId;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i6.NewsScreen]
class NewsRoute extends _i10.PageRouteInfo<void> {
  const NewsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ScheduleScreen]
class ScheduleRoute extends _i10.PageRouteInfo<void> {
  const ScheduleRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TeamCompositionScreen]
class TeamCompositionRoute extends _i10.PageRouteInfo<void> {
  const TeamCompositionRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TeamCompositionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeamCompositionRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.TournamentsScreen]
class TournamentsRoute extends _i10.PageRouteInfo<void> {
  const TournamentsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TournamentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TournamentsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
