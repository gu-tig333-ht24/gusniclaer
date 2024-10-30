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

  Future<void> boxChecked(taskID) async {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskID);
    if (taskIndex != -1) {
      try {
        _tasks[taskIndex].isDone();
        await api.updateTask(
            taskID, _tasks[taskIndex].description, _tasks[taskIndex].done);

        notifyListeners();
      } catch (e) {
        print('Error updating task: $e');
      }
    }
  }

  Future<void> removeTask(String taskID) async {
    try {
      await api.deleteTask(taskID);
      _tasks.removeWhere((task) => task.id == taskID);
      notifyListeners();
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
