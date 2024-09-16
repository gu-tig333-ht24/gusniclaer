import 'package:flutter/material.dart';
import 'package:template/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(221, 0, 110, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'APP'),
    );
  }
}

