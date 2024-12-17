import 'package:flutter/material.dart';
import 'package:loco_2012/screens/dashboard.dart';



void main() {
  runApp(const LokoApp());
}

class LokoApp extends StatelessWidget {
  const LokoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loko2012',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardScreen(
          title: 'Loko2012'),
    );
  }
}
