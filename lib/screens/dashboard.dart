// // import 'package:auto_route/auto_route.dart';
// // import 'package:flutter/material.dart';
// // import '../navigation/app_router.gr.dart';
// // import '../widgets/select_field.dart';
// //
// // @RoutePage()
// // class DashboardScreen extends StatefulWidget {
// //   const DashboardScreen({
// //     super.key,
// //   });
// //
// //   static const routeName = 'DashboardScreenRoute';
// //
// //   static Page<dynamic> page() => const MaterialPage<void>(
// //         name: routeName,
// //         key: ValueKey(routeName),
// //         child: DashboardScreen(),
// //       );
// //
// //   @override
// //   State<DashboardScreen> createState() => _DashboardScreenState();
// // }
// //
// // class _DashboardScreenState extends State<DashboardScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.green,
// //       appBar: AppBar(
// //         centerTitle: true,
// //         backgroundColor: Colors.red,
// //         titleTextStyle: const TextStyle(
// //           color: Colors.green,
// //           fontSize: 40,
// //           fontWeight: FontWeight.w600,
// //         ),
// //         title: const Text("Loko2012"),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 16),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             SelectField(
// //               onTap: () {
// //                 context.router.push(const NewsRoute());
// //               },
// //               text: "Останні новини",
// //               backgroundColor: Colors.green,
// //             ),
// //             const SizedBox(height: 54),
// //             SelectField(
// //               onTap: () {
// //                 context.router.push(const ScheduleRoute());
// //               },
// //               text: "Розклад на тиждень",
// //               backgroundColor: Colors.green,
// //             ),
// //             const SizedBox(height: 54),
// //             SelectField(
// //               onTap: () {
// //                 context.router.push(const TeamCompositionRoute());
// //               },
// //               text: "Склади команд",
// //               backgroundColor: Colors.green,
// //             ),
// //             const SizedBox(height: 54),
// //             SelectField(
// //               onTap: () {
// //                 context.router.push(const CoachesRoute());
// //               },
// //               text: "Тренери",
// //               backgroundColor: Colors.green,
// //             ),
// //             const SizedBox(height: 54),
// //             SelectField(
// //               onTap: () {
// //                 context.router.push(const TournamentsRoute());
// //               },
// //               text: "Наступні турніри",
// //               backgroundColor: Colors.green,
// //             ),
// //             const SizedBox(height: 54),
// //             SelectField(
// //               onTap: () {
// //                 context.router.push(const UsefulLinksRoute());
// //               },
// //               text: "Корисні посилання",
// //               backgroundColor: Colors.green,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import '../navigation/app_router.gr.dart';
//
// @RoutePage()
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   static const routeName = 'DashboardScreenRoute';
//
//   static Page<dynamic> page() => const MaterialPage<void>(
//     name: routeName,
//     key: ValueKey(routeName),
//     child: DashboardScreen(),
//   );
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   int _currentIndex = 0;
//
//   final List<Widget> _pages = [
//     Center(child: Text("Останні новини")),
//     Center(child: Text("Розклад на тиждень")),
//     Center(child: Text("Склади команд")),
//     Center(child: Text("Тренери")),
//     Center(child: Text("Наступні турніри")),
//     Center(child: Text("Корисні посилання")),
//   ];
//
//   final List<PageRouteInfo> _routes = [
//     const NewsRoute(),
//     const ScheduleRoute(),
//     const TeamCompositionRoute(),
//     const CoachesRoute(),
//     const TournamentsRoute(),
//     const UsefulLinksRoute(),
//   ];
//
//   void _onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//       context.router.push(_routes[index]);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.red,
//         titleTextStyle: const TextStyle(
//           color: Colors.green,
//           fontSize: 40,
//           fontWeight: FontWeight.w600,
//         ),
//         title: const Text("Loko2012"),
//       ),
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onTabTapped,
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.article),
//             label: "Новини",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.schedule),
//             label: "Розклад",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.people),
//             label: "Склади",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: "Тренери",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.sports_soccer),
//             label: "Турніри",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.link),
//             label: "Посилання",
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../navigation/app_router.gr.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const routeName = 'DashboardScreenRoute';

  static Page<dynamic> page() => const MaterialPage<void>(
    name: routeName,
    key: ValueKey(routeName),
    child: DashboardScreen(),
  );

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<PageRouteInfo> _routes = [
    const DashboardRoute(), // Dashboard как первая вкладка
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
      context.router.replace(_routes[index]); // Навигация с заменой маршрута
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
          "Loko2012",
          style: TextStyle(
            color: Colors.green,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Добро пожаловать в дашборд!",
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
