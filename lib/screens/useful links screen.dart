import 'package:flutter/material.dart';

class UsefulLinksScreen extends StatefulWidget {
  const UsefulLinksScreen({super.key,});




  @override
  State<UsefulLinksScreen> createState() => _UsefulLinksScreenState();
}

class _UsefulLinksScreenState extends State<UsefulLinksScreen> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,


      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        titleTextStyle:  const TextStyle(color: Colors.green,fontSize: 40,
            fontWeight: FontWeight.w600),
        title: const Text("Корисні посилання", style: TextStyle(color:
        Colors.green,fontSize: 40,
            fontWeight: FontWeight.w600)),
      ),
    );
  }
}