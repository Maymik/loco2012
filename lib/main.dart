import 'package:flutter/material.dart';
import 'package:loco_2012/screens/coaches_screen.dart';
import 'package:loco_2012/screens/splash_screen.dart';
import 'package:loco_2012/screens/team_composition_screen.dart';
import 'package:loco_2012/screens/tournaments_screen.dart';
import 'package:loco_2012/widgets/custom_bottom_navigation_bar.dart';
import 'screens/news_screen.dart';
import 'screens/schedule_screen.dart';

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
  bool _isLoading = true;


  final List<Widget> _screens = [
    const NewsScreen(),
    const ScheduleScreen(),
    const TeamCompositionScreen(),
    const CoachesScreen(),
    const TournamentsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  void _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      _isLoading = false;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loko2012',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _isLoading
          ? const SplashScreen()
          :
      Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTabTapped: _onTabTapped,
        ),
      ),
    );
  }
}
