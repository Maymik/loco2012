import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'TeamCompositionRoute')
class TeamCompositionScreen extends StatefulWidget {
  const TeamCompositionScreen({
    super.key,
  });

  @override
  State<TeamCompositionScreen> createState() => _TeamCompositionScreenState();
}

class _TeamCompositionScreenState extends State<TeamCompositionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        titleTextStyle: const TextStyle(
            color: Colors.green, fontSize: 40, fontWeight: FontWeight.w600),
        title: const Text("Склади команд",
            style: TextStyle(
                color: Colors.green,
                fontSize: 40,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
