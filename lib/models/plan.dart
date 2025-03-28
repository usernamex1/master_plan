import 'task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({required this.name, this.tasks = const []});

  Plan copyWith({String? name, List<Task>? tasks}) {
    return Plan(
      name: name ?? this.name,
      tasks: tasks ?? this.tasks,
    );
  }

  int get completedCount => tasks.where((task) => task.complete).length;

  String get completenessMessage {
    return "Completed $completedCount of ${tasks.length} tasks.";
  }

  get isCompleted => null;
}