// import 'package:auto_route/annotations.dart';
// import 'package:flutter/material.dart';
//
// @RoutePage()
// class NewsScreen extends StatefulWidget {
//   const NewsScreen({super.key,});
//
//
//
//
//   @override
//   State<NewsScreen> createState() => _NewsScreenState();
// }
//
// class _NewsScreenState extends State<NewsScreen> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.green,
//
//
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.red,
//         titleTextStyle:  const TextStyle(color: Colors.green,fontSize: 40,
//             fontWeight: FontWeight.w600),
//         title: const Text("Останні новини", style: TextStyle(color:
//         Colors.green,fontSize: 40,
//             fontWeight: FontWeight.w600)),
//       ),
//     );
//   }
// }

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  static const routeName = 'NewsScreenRoute';

  static Page<dynamic> page() => const MaterialPage<void>(
    name: routeName,
    key: ValueKey(routeName),
    child: NewsScreen(),
  );

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
    );
  }
}
