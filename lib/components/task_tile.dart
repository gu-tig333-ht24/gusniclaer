import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/states/list_handler.dart';

class TaskTile extends StatelessWidget {
  final String taskDescription;
  final bool taskDone;
  final int taskTileIndex;

  TaskTile({
    super.key,
    required this.taskDescription,
    required this.taskDone,
    required this.taskTileIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 11, left: 8, right: 8),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            AnimatedSwitcher(
              duration: Duration.zero,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Checkbox(
                key: ValueKey(taskDone),
                value: taskDone,
                activeColor: Colors.green,
                checkColor: Colors.black87,
                onChanged: (_) {
                  context.read<ListHandler>().boxChecked(
                        context.read<ListHandler>().currentTasks[taskTileIndex],
                      );
                },
              ),
            ),
            Expanded(
              child: Text(
                taskDescription,
                style: TextStyle(
                    decoration: taskDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
            GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                context.read<ListHandler>().removeTask(
                      context.read<ListHandler>().currentTasks[taskTileIndex],
                    );
              },
            )
          ],
        ),
        decoration: BoxDecoration(
            color: const Color.fromARGB(221, 255, 199, 199),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset.fromDirection(0.8, 3)),
            ]),
      ),
    );
  }
}
