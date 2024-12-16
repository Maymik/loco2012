import 'package:flutter/material.dart';

class CoachesScreen extends StatefulWidget {
  const CoachesScreen({super.key,});




  @override
  State<CoachesScreen> createState() => _CoachesScreenState();
}

class _CoachesScreenState extends State<CoachesScreen> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,


      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        titleTextStyle:  const TextStyle(color: Colors.green,fontSize: 40,
            fontWeight: FontWeight.w600),
        title: const Text("Тренери", style: TextStyle(color:
        Colors.green,fontSize: 40,
            fontWeight: FontWeight.w600)),
      ),
    );
  }
}