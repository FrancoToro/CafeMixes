import 'package:flutter/material.dart';
import 'pages/my_home_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'CafeMixes',
      home: const MyHomePage(),
      color: const Color.fromARGB(221, 255, 255, 255),
    );
  }
}
