import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

@RoutePage(name: 'NewsRoute')
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
          color: Colors.green,
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
        title: const Text(
          AppConstants.news,
          style: TextStyle(
            color: Colors.green,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          AppConstants.news,
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
