import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/screens/home.dart';
import 'package:template/states/list_handler.dart';
import 'package:template/components/api_handler.dart' as api;

void main() {
  api.fetchTasks();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ListHandler(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do-App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(221, 0, 110, 255)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
