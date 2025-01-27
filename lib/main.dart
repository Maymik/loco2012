import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/utils/service_locator.dart';

import 'features/coaches/cubit/coaches_cubit.dart';
import 'features/coaches/ui/coaches_screen.dart';
import 'features/news/cubit/news_cubit.dart';
import 'features/news/ui/news_screen.dart';
import 'features/phone_auth/cubit/phone_auth_cubit.dart';
import 'features/phone_auth/ui/phone_auth_screen.dart';
import 'features/schedule/cubit/schedule_cubit.dart';
import 'features/schedule/ui/schedule_screen.dart';
import 'features/team_composition/cubit/team_composition_cubit.dart';
import 'features/team_composition/ui/team_composition_screen.dart';
import 'features/tournaments/cubit/tournaments_cubit.dart';
import 'features/tournaments/ui/tournaments_screen.dart';
import 'firebase_options.dart';
import 'navigation/app_router.dart';
import 'widgets/custom_bottom_navigation_bar.dart';
import 'widgets/custom_circular_indicator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PhoneAuthCubit()),
        BlocProvider(create: (_) => TournamentsCubit()..subscribeToTournaments()),
        BlocProvider(create: (_) => NewsCubit()..subscribeToNews()),
        BlocProvider(create: (_) => CoachesCubit()..subscribeCoaches()),
        BlocProvider(
            create: (_) => TeamCompositionCubit()..subscribeTeamComposition()),
        BlocProvider(create: (_) => ScheduleCubit()..subscribeToSchedule()),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Loko2012',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: (context, router) {
          return Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (_) => BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
                  builder: (context, state) {
                    if (state is PhoneAuthSuccess) {
                      return const MainContent();
                    } else {
                      return const PhoneAuthScreen();
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  MainContentState createState() => MainContentState();
}

class MainContentState extends State<MainContent> {
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
    _pageController?.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageController == null
          ? const Center(child: FootballLoadingIndicator())
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
    );
  }
}
