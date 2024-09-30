import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = 'b536073e-3a00-47f3-9bd0-4fa3500b3df6';

Future<List> fetchTasks() async {
  final url = Uri.parse('https://todoapp-api.apps.k8s.gu.se/todos?key=$apiKey');

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final listOfTasks = response.body;
      print('THE FETCHED LIST: $listOfTasks');
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load your tasks');
    }
  } catch (e) {
    throw Exception('Error fetching tasks: $e');
  }
}

Future<void> addTask(String description) async {
  final url = Uri.parse('https://todoapp-api.apps.k8s.gu.se/todos?key=$apiKey');
  final newTask = {
    "title": description,
    "done": false,
  };

  try {
    final response = await http.post(
      url,
      headers: {"Content-type": "application/json"},
      body: jsonEncode(newTask),
    );
    print(response.body);
    if (response.statusCode == 200) {}
  } catch (e) {
    throw Exception('Error adding task: $e');
  }
}

Future<void> updateTask(String id, String description, bool done) async {
  final url =
      Uri.parse('https://todoapp-api.apps.k8s.gu.se/todos/$id?key=$apiKey');
  final taskToBeUpdated = {
    "title": description,
    "done": done,
  };

  try {
    final response = await http.put(
      url,
      headers: {"Content-type": "application/json"},
      body: jsonEncode(taskToBeUpdated),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update task.');
    }
  } catch (e) {
    throw Exception('Error updating task: $e');
  }
}

Future<void> deleteTask(String id) async {
  final url =
      Uri.parse('https://todoapp-api.apps.k8s.gu.se/todos/$id?key=$apiKey');

  try {
    final http.Response response = await http.delete(url);
    print(response.body);
    if (response.statusCode != 200) {
      throw Exception('Failed to delete task error not 200');
    }
  } catch (e) {
    throw Exception('Failed to delete task: $e');
  }
}
