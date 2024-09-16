import 'package:flutter/material.dart';
import 'package:template/screens/create_task.dart';

import '../components/task_tile.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  static List<String> list1 = <String>['ALL', 'DONE', 'UNDONE'];


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 155, 155, 155),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(137, 80, 78, 78), 
        title: Text('TODO APP'),
        actions: <Widget>[

          // add function to the button 
          GestureDetector(child: Icon(Icons.more_vert),
          onTap: () {}
          )

          ] 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTaskPage()));
          },
        shape: CircleBorder(),
        child: Icon(Icons.add),
        ),
      body: ListView(
        children: [
          TaskTile(
            taskDescription: 'Lämna Zakaria', 
            taskDone: true, 
            isChanged: (p0) {}, 
            ),
          TaskTile(
            taskDescription: 'Plugga', 
            taskDone: false, 
            isChanged: (p0) {}, 
            ),
          TaskTile(
            taskDescription: 'Hämta ut paket', 
            taskDone: true, 
            isChanged: (p0) {}, 
            ),
          TaskTile(
            taskDescription: 'Hämta Zakaria', 
            taskDone: true, 
            isChanged: (p0) {}, 
            ),
          TaskTile(
            taskDescription: 'Träna', 
            taskDone: false, 
            isChanged: (p0) {}, 
            ),
        ],
      ),
      
    );
  }
}
