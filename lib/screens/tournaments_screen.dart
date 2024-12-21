import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

@RoutePage(name: 'TournamentsRoute')
class TournamentsScreen extends StatefulWidget {
  const TournamentsScreen({
    super.key,
  });

  @override
  State<TournamentsScreen> createState() => _TournamentsScreenState();
}

class _TournamentsScreenState extends State<TournamentsScreen> {
  int _currentIndex = 0;

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
        title: const Text(
          AppConstants.tournaments,
          style: TextStyle(
              color: Colors.green, fontSize: 40, fontWeight: FontWeight.w600),
        ),
      ),
      body: const Center(
        child: Text(
          AppConstants.tournaments,
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
