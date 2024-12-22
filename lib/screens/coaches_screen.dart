import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

@RoutePage(name: 'CoachesRoute')
class CoachesScreen extends StatefulWidget {
  const CoachesScreen({
    super.key,
  });

  @override
  State<CoachesScreen> createState() => _CoachesScreenState();
}

class _CoachesScreenState extends State<CoachesScreen> {
  int _currentIndex = 3;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    context.router.navigate(AppConstants.routes[index]);
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
        title: const Text(AppConstants.coaches,
            style: TextStyle(
                color: Colors.green,
                fontSize: 40,
                fontWeight: FontWeight.w600)),
      ),
      body: const Center(
        child: Text(
          AppConstants.coaches,
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
