import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../navigation/app_router.gr.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

@RoutePage(name: 'NewsRoute')
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int _currentIndex = 0;

  final List<PageRouteInfo> _routes = [
    const DashboardRoute(),
    const NewsRoute(),
    const ScheduleRoute(),
    const TeamCompositionRoute(),
    const CoachesRoute(),
    const TournamentsRoute(),
    const UsefulLinksRoute(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      context.router.replace(_routes[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        titleTextStyle: const TextStyle(
          color: Colors.green,
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
        title: const Text(
          "Останні новини",
          style: TextStyle(
            color: Colors.green,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          "Останні новини",
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
