import 'package:flutter/material.dart';
import 'package:loKo_2012/widgets/selectField.dart';


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
      home: const Dashboard(title: 'Loko2012'),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});


  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {



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
