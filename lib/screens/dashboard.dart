import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/selectField.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.title});


  final String title;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,


      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        titleTextStyle:  const TextStyle(color: Colors.green,fontSize: 40,
            fontWeight: FontWeight.w600),

        title: Text(widget.title),
      ),
      body:  Padding( padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectField(callback: (){}, text: "Останні новини",
              backgroundColor: Colors.green,),
            const SizedBox(height: 54,),
            SelectField(callback: (){}, text: "Розклад на тиждень",
              backgroundColor: Colors.green,),
            const SizedBox(height: 54,),
            SelectField(callback: (){}, text: "Склади команд",
              backgroundColor: Colors.green,),
            const SizedBox(height: 54,),
            SelectField(callback: (){}, text: "Тренери",
              backgroundColor: Colors.green,),
            const SizedBox(height: 54,),
            SelectField(callback: (){}, text: "Наступні турніри"
              ,backgroundColor: Colors.green,),
            const SizedBox(height: 54,),
            SelectField(callback: (){}, text: "Корисні посилання"
              ,backgroundColor: Colors.green,),
          ],

        ),
      ),
    );
  }
}