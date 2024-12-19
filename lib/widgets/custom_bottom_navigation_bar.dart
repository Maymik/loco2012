// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import '../navigation/app_router.gr.dart';
//
// class CustomBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTabTapped;
//
//   const CustomBottomNavigationBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTabTapped,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: (index) => onTabTapped(index),
//       backgroundColor: Colors.white,
//       selectedItemColor: Colors.green,
//       unselectedItemColor: Colors.grey,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.article),
//           label: "Новини",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.schedule),
//           label: "Розклад",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.people),
//           label: "Склади",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.school),
//           label: "Тренери",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.sports_soccer),
//           label: "Турніри",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.link),
//           label: "Посилання",
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

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
      currentIndex: currentIndex,
      onTap: (index) => onTabTapped(index),
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: "Дашборд",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: "Новини",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: "Розклад",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: "Склади",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: "Тренери",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_soccer),
          label: "Турніри",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.link),
          label: "Посилання",
        ),
      ],
    );
  }
}
