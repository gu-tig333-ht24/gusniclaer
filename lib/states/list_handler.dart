import 'package:flutter/material.dart';
import 'package:template/components/task.dart';

class ListHandler extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(description: 'Your first task: Add a new task', done: false),
    Task(description: '<-- Tap the check box <--', done: false),
    Task(
        description: 'Try filtering the tasks: Three dots - top right corner',
        done: false),
    Task(description: '--> Remove this task -->', done: false),
  ];

  String filtering = 'all';

  List<Task> get currentTasks {
    if (filtering == 'done') {
      return _tasks.where((task) => task.done).toList();
    } else if (filtering == 'undone') {
      return _tasks.where((task) => !task.done).toList();
    } else {
      return _tasks;
    }
  }

  void addTask(Task newTask) {
    currentTasks.add(newTask);
    notifyListeners();
  }

  void boxChecked(Task existingTask) {
    final taskIndex = _tasks.indexWhere((task) => task.id == existingTask.id);
    if (taskIndex != -1) {
      _tasks[taskIndex].isDone();
      notifyListeners();
    }
  }

  void removeTask(Task existingTask) {
    _tasks.removeWhere((task) => task.id == existingTask.id);
    notifyListeners();
  }

  void changeCurrentFiltering(String filteringOption) {
    filtering = filteringOption;
    notifyListeners();
    print(filtering);
  }
}
