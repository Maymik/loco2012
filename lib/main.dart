// import 'package:flutter/material.dart';
// import 'package:loco_2012/screens/dashboard.dart';
//
//
//
// void main() {
//   runApp(const LokoApp());
// }
//
// class LokoApp extends StatelessWidget {
//   const LokoApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Loko2012',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const DashboardScreen(
//           title: 'Loko2012'),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
//
// import 'navigation/app_router.dart';
//
// void main() {
//   final appRouter = AppRouter();
//   runApp(MyApp(appRouter: appRouter));
// }
//
// class MyApp extends StatelessWidget {
//   final AppRouter appRouter;
//
//   const MyApp({super.key, required this.appRouter});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerDelegate: appRouter.delegate(),
//       routeInformationParser: appRouter.defaultRouteParser(),
//       title: 'Loko2012',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'navigation/app_router.dart';

void main() {
  final appRouter = AppRouter();
  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: 'Loko2012',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
