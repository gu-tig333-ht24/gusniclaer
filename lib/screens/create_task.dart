import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/task.dart';
import 'package:template/states/list_handler.dart';

class CreateTaskPage extends StatelessWidget {
  CreateTaskPage({super.key});

  final controller = TextEditingController();

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
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'What are you going to do?'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<ListHandler>().addTask(
                        Task(description: controller.text, done: false),
                      );
                  controller.clear();
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text('ADD'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
