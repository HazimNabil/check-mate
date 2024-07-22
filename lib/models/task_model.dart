class Task {
  final String title;
  final bool isChecked;
  final bool isPinned;
  final int color;
  final String label;

  Task({
    required this.title,
    required this.isChecked,
    required this.isPinned,
    required this.color,
    required this.label,
  });

  factory Task.fromJson(jsonData) {
    return Task(
      title: jsonData['title'],
      isChecked: jsonData['isChecked'],
      isPinned: jsonData['isPinned'],
      color: jsonData['color'],
      label: jsonData['label'],
    );
  }
}
