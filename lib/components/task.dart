import 'package:flutter/material.dart';

class Task {
  String id;
  final String description;
  bool done;

  Task({
    required this.description,
    required this.done,
  }) : id = UniqueKey().toString();

  void isDone() {
    done = !done;
  }
}
