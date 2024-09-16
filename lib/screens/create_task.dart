import 'package:flutter/material.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(137, 80, 78, 78), 
        title: Text('TODO APP'),
      ),
      body: Column(
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 244, 250, 255),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What are you going to do?'
                ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            GestureDetector(
              child: Row(children: [Icon(Icons.add), Text('ADD')]
              // add function to the button 
            ),
            )
          ],)
        ],
      ),
    );
  }
}