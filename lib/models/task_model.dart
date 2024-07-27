class Task {
  final String title;
  final bool isChecked;
  final bool isPinned;
  final int color;
  final String label;

  Task({
    required this.title,
    this.isChecked = false,
    this.isPinned = false,
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
