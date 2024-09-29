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
      title: 'Demostracion de Flutter',
      theme: ThemeData(
        fontFamily: 'PerfectBomber',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 255, 255),
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'PerfectBomber',
          ),
        ),
      ),
      home:  MyHomePage(),
      color: const Color.fromARGB(221, 56, 27, 24),
    );
  }
}
