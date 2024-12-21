import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: (index) => onTabTapped(index),
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: AppConstants.news,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: AppConstants.schedule,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: AppConstants.teamComposition,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: AppConstants.coaches,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_soccer),
          label: AppConstants.tournaments,
        ),
      ],
    );
  }
}


