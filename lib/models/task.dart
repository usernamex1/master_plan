class Task {
  final String name;
  final String description;
  final bool complete;

  const Task({required this.name, required this.description, this.complete = false});

  /// Method untuk menyalin objek Task dengan perubahan tertentu
  Task copyWith({String? name, String? description, bool? complete}) {
    return Task(
      name: name ?? this.name,
      description: description ?? this.description,
      complete: complete ?? this.complete,
    );
  }
}