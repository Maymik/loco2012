import 'package:flutter/material.dart';
import 'package:loco2012/widgets/selectField.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loco2012',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Loco2012'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



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
