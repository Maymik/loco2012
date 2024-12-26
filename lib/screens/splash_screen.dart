// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/logo.png',
//               width: 250,
//               height: 250,
//             ),
//             // Icon(
//             //   Icons.sports_soccer,
//             //   size: 100,
//             //   color: Colors.white,
//             // ),
//             const SizedBox(height: 20),
//             const Text(
//               'Loko2012',
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<void> _imagePreload;

  @override
  void initState() {
    super.initState();
    _imagePreload = _preloadImage();
  }

  Future<void> _preloadImage() async {
    await precacheImage(const AssetImage('assets/images/logo.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _imagePreload,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const _SplashContent();
        } else {
          return const SizedBox.shrink(); // Пустой экран до завершения загрузки
        }
      },
    );
  }
}

class _SplashContent extends StatelessWidget {
  const _SplashContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              'Loko2012',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
