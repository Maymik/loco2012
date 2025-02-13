// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:loco_2012/features/coaches/ui/coaches_screen.dart' as _i1;
import 'package:loco_2012/features/news/ui/news_detail.dart' as _i2;
import 'package:loco_2012/features/news/ui/news_screen.dart' as _i3;
import 'package:loco_2012/features/schedule/ui/schedule_screen.dart' as _i4;
import 'package:loco_2012/features/team_composition/ui/team_composition_screen.dart'
    as _i5;
import 'package:loco_2012/features/tournaments/ui/tournaments_screen.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    CoachesRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CoachesScreen(),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<NewsDetailRouteArgs>(
          orElse: () =>
              NewsDetailRouteArgs(newsId: pathParams.getString('newsId')));
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.NewsDetailScreen(
          newsId: args.newsId,
          key: args.key,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.NewsScreen(),
      );
    },
    ScheduleRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ScheduleScreen(),
      );
    },
    TeamCompositionRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TeamCompositionScreen(),
      );
    },
    TournamentsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TournamentsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CoachesScreen]
class CoachesRoute extends _i7.PageRouteInfo<void> {
  const CoachesRoute({List<_i7.PageRouteInfo>? children})
      : super(
          CoachesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoachesRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.NewsDetailScreen]
class NewsDetailRoute extends _i7.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    required String newsId,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            newsId: newsId,
            key: key,
          ),
          rawPathParams: {'newsId': newsId},
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const _i7.PageInfo<NewsDetailRouteArgs> page =
      _i7.PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    required this.newsId,
    this.key,
  });

  final String newsId;

  final _i8.Key? key;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{newsId: $newsId, key: $key}';
  }
}

/// generated route for
/// [_i3.NewsScreen]
class NewsRoute extends _i7.PageRouteInfo<void> {
  const NewsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ScheduleScreen]
class ScheduleRoute extends _i7.PageRouteInfo<void> {
  const ScheduleRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TeamCompositionScreen]
class TeamCompositionRoute extends _i7.PageRouteInfo<void> {
  const TeamCompositionRoute({List<_i7.PageRouteInfo>? children})
      : super(
          TeamCompositionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeamCompositionRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TournamentsScreen]
class TournamentsRoute extends _i7.PageRouteInfo<void> {
  const TournamentsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          TournamentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TournamentsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
