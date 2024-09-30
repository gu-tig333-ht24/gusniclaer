import 'package:flutter/material.dart';
import 'package:template/components/task.dart';
import 'package:template/components/api_handler.dart' as api;

class ListHandler extends ChangeNotifier {
  List<Task> _tasks = [];

  String filtering = 'all';

  ListHandler() {
    fetchTasksFromServer();
  }

  Future<void> fetchTasksFromServer() async {
    final fetchedTasks = await api.fetchTasks();
    _tasks = fetchedTasks.map((taskData) => Task.fromJson(taskData)).toList();
    notifyListeners();
  }

  List<Task> get currentTasks {
    if (filtering == 'done') {
      return _tasks.where((task) => task.done).toList();
    } else if (filtering == 'undone') {
      return _tasks.where((task) => !task.done).toList();
    } else {
      return _tasks;
    }
  }

  Future<void> addTask(String description) async {
    try {
      await api.addTask(description);
      await fetchTasksFromServer();
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  Future<void> boxChecked(Task existingTask) async {
    final taskIndex = _tasks.indexWhere((task) => task.id == existingTask.id);
    if (taskIndex != -1) {
      _tasks[taskIndex].isDone();
      notifyListeners();

      try {
        await api.updateTask(existingTask.id, _tasks[taskIndex].description,
            _tasks[taskIndex].done);
      } catch (e) {
        print('Error updating task: $e');
      }
    }
  }

  Future<void> removeTask(Task existingTask) async {
    _tasks.removeWhere((task) => task.id == existingTask.id);
    notifyListeners();

    try {
      await api.deleteTask(existingTask.id);
    } catch (e) {
      print('Error deleting task: $e');
    }
  }

  void changeCurrentFiltering(String filteringOption) {
    filtering = filteringOption;
    notifyListeners();
    print(filtering);
  }
}
