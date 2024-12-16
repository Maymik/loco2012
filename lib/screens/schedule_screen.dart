import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key,});




  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,


      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        titleTextStyle:  const TextStyle(color: Colors.green,fontSize: 40,
            fontWeight: FontWeight.w600),
        title: const Text("Розклад на тиждень", style: TextStyle(color:
        Colors.green,fontSize: 40,
            fontWeight: FontWeight.w600)),
      ),
    );
  }
}