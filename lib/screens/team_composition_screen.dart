import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../navigation/app_router.gr.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

@RoutePage(name: 'TeamCompositionRoute')
class TeamCompositionScreen extends StatefulWidget {
  const TeamCompositionScreen({
    super.key,
  });

  @override
  State<TeamCompositionScreen> createState() => _TeamCompositionScreenState();
}

class _TeamCompositionScreenState extends State<TeamCompositionScreen> {
  int _currentIndex = 0;

  final List<PageRouteInfo> _routes = [
    const NewsRoute(),
    const ScheduleRoute(),
    const TeamCompositionRoute(),
    const CoachesRoute(),
    const TournamentsRoute(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    context.router.navigate(_routes[index]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.red,
        titleTextStyle: const TextStyle(
            color: Colors.green, fontSize: 40, fontWeight: FontWeight.w600),
        title: const Text("Склади команд",
            style: TextStyle(
                color: Colors.green,
                fontSize: 40,
                fontWeight: FontWeight.w600)),
      ),
      body: const Center(
        child: Text(
          "Склади команд",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
