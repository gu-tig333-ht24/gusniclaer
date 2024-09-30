class Task {
  String id;
  final String description;
  bool done;

  Task({
    required this.id,
    required this.description,
    required this.done,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      description: json['title'],
      done: json['done'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': description,
      'done': done,
    };
  }

  void isDone() {
    done = !done;
  }
}
