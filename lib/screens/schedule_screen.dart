import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

@RoutePage(name: 'ScheduleRoute')
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({
    super.key,
  });

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _currentIndex = 1;

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
        title: const Text(AppConstants.schedule,
            style: TextStyle(
                color: Colors.green,
                fontSize: 40,
                fontWeight: FontWeight.w600)),
      ),
      body: const Center(
        child: Text(
          AppConstants.schedule,
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
