import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/components/custom_appbar.dart';
import 'package:template/states/list_handler.dart';

class CreateTaskPage extends StatelessWidget {
  CreateTaskPage({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 144, 191),
      appBar: CustomAppBar(
        actions: [],
      ),
      body: Column(
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 244, 250, 255),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black87, width: 0.2),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0),
                      spreadRadius: 0.5,
                      blurRadius: 2,
                      offset: Offset.fromDirection(0.8, 3)),
                ]),
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
                  context.read<ListHandler>().addTask(controller.text);
                  controller.clear();
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Icon(Icons.note_add),
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
