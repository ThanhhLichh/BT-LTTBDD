class Task {
  final int id;
  final String title;
  final String description;
  final String status;
  final String priority;
  final String category;
  final String dueDate;
  final List subtasks;
  final List attachments;
  final List reminders;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.category,
    required this.dueDate,
    required this.subtasks,
    required this.attachments,
    required this.reminders,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      priority: json['priority'],
      category: json['category'],
      dueDate: json['dueDate'],
      subtasks: json['subtasks'] ?? [],
      attachments: json['attachments'] ?? [],
      reminders: json['reminders'] ?? [],
    );
  }
}
