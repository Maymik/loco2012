import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loco_2012/utils/firebase_messaging_service.dart';
import 'package:loco_2012/utils/notification_service.dart';
import 'package:loco_2012/utils/service_locator.dart';

import 'features/coaches/cubit/coaches_cubit.dart';
import 'features/coaches/ui/coaches_screen.dart';
import 'features/news/cubit/news_cubit.dart';
import 'features/news/ui/news_detail.dart';
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
import 'widgets/custom_bottom_navigation_bar.dart';
import 'widgets/custom_circular_indicator.dart';

void main() async {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupLocator();
  FirebaseMessagingService().init(navigatorKey);
  NotificationService().init(navigatorKey);
  runApp(MyApp(navigatorKey: navigatorKey));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({super.key, required this.navigatorKey});

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
      child: MaterialApp(
        title: 'Loko2012',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: navigatorKey,
        onGenerateRoute: (settings) {
          if (settings.name == '/newsDetail') {
            final String newsId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => NewsDetailScreen(newsId: newsId),
            );
          }
          return null;
        },
        builder: (context, child) {
          return Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (_) => BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
                  builder: (context, state) {
                    final user = FirebaseAuth.instance.currentUser;
                    if (state is PhoneAuthSuccess || user != null) {
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
              children: [
                Navigator(
                  key: NotificationService().navigatorKey,
                  onGenerateRoute: (settings) {
                    if (settings.name == '/newsDetail') {
                      final String newsId = settings.arguments as String;
                      return MaterialPageRoute(
                        builder: (context) => NewsDetailScreen(newsId: newsId),
                      );
                    }
                    return MaterialPageRoute(
                      builder: (context) => const NewsScreen(),
                    );
                  },
                ),
                const ScheduleScreen(),
                const TeamCompositionScreen(),
                const CoachesScreen(),
                const TournamentsScreen(),
              ],
            ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
