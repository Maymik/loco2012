import 'package:firebase_core/firebase_core.dart';
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
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController?.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TournamentsCubit()..subscribeToTournaments()),
        BlocProvider(create: (_) => NewsCubit()..subscribeToNews()),
        BlocProvider(create: (_) => CoachesCubit()..subscribeCoaches()),
        BlocProvider(
            create: (_) => TeamCompositionCubit()..subscribeTeamComposition()),
        BlocProvider(create: (_) => ScheduleCubit()..subscribeToSchedule()),
      ],
      child: MaterialApp(
        title: 'Loko2012',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: _pageController == null
              ? const Center(child: CircularProgressIndicator())
              : PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: const [
                    NewsScreen(),
                    ScheduleScreen(),
                    TeamCompositionScreen(),
                    CoachesScreen(),
                    TournamentsScreen(),
                  ],
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
