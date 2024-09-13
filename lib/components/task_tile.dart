import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  
  final String taskDescription;
  final bool taskDone;
  Function(bool?)? isChanged;
  
  

  TaskTile({super.key, required this.taskDescription, required this.taskDone, required this.isChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 11, left: 8, right: 8),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            
            // checkbox to monitor task status  
            Checkbox(value: taskDone, onChanged: isChanged),

            // the task description
            Expanded(child: Text(taskDescription)),
            
            // the close "X" to remove the task 
            GestureDetector(
              child: 
              Icon(Icons.close),
              // add remove function 
            )
          ],
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(221, 255, 255, 255),
          borderRadius: BorderRadius.circular(5),
      ),
      )
    );
  }
}