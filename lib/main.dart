
import 'package:flutter/material.dart';
import 'package:loco2012/widgets/selectField.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

//  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
     // routerConfig: _appRouter.config(),
      title: 'Loco2012',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});


  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {



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
              SelectField(callback: (){
              //  AutoRouter.of(context).
              //push(const TeamCompositionRoute());
                }, text: "Склади команд",
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
