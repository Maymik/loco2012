import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/widgets/custom_bottom_navigation_bar.dart';
import 'features/coaches/coaches_cubit.dart';
import 'features/coaches/coaches_screen.dart';
import 'features/news/news_cubit.dart';
import 'features/news/news_screen.dart';
import 'features/schedule/schedule_cubit.dart';
import 'features/schedule/schedule_screen.dart';
import 'features/team_composition/team_composition_cubit.dart';
import 'features/team_composition/team_composition_screen.dart';
import 'features/tournaments/tournaments_cubit.dart';
import 'features/tournaments/tournaments_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const NewsScreen(),
    const ScheduleScreen(),
    const TeamCompositionScreen(),
    const CoachesScreen(),
    const TournamentsScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TournamentsCubit()..loadTournaments()),
        BlocProvider(create: (_) => NewsCubit()..loadNews()),
        BlocProvider(create: (_) => CoachesCubit()..loadCoaches()),
        BlocProvider(create: (_) => TeamCompositionCubit()..loadTeamComposition()),
        BlocProvider(create: (_) => ScheduleCubit()..loadSchedule()),
      ],
      child: MaterialApp(
        title: 'Loko2012',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: _currentIndex,
            onTabTapped: _onTabTapped,
          ),
        ),
      ),
    );
  }
}
