import 'package:flutter/material.dart';

class TournamentsScreen extends StatefulWidget {
  const TournamentsScreen({super.key,});




  @override
  State<TournamentsScreen> createState() => _TournamentsScreenState();
}

class _TournamentsScreenState extends State<TournamentsScreen> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,


      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        titleTextStyle:  const TextStyle(color: Colors.green,fontSize: 40,
            fontWeight: FontWeight.w600),
        title: const Text("Наступні турніри", style: TextStyle(color:
        Colors.green,fontSize: 40,
            fontWeight: FontWeight.w600)),
      ),
    );
  }
}