import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loco_2012/widgets/custom_bottom_navigation_bar.dart';
import 'package:loco_2012/widgets/custom_circular_indicator.dart';

import 'features/coaches/ui/coaches_screen.dart';
import 'features/news/ui/news_screen.dart';
import 'features/schedule/ui/schedule_screen.dart';
import 'features/team_composition/ui/team_composition_screen.dart';
import 'features/tournaments/ui/tournaments_screen.dart';

@RoutePage(name: 'MainContentRoute')
class MainContent extends StatefulWidget {
  const MainContent({
    super.key,
  });

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
          ? const Center(
              child: FootballLoadingIndicator(
              size: 80,
            ))
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
