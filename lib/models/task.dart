class Task {
  int? taskId;
  String title;
  String description;
  String status;
  DateTime Deadline;
  DateTime createDate;

  Task({
    this.taskId,
      required this.title,
      required this.description,
      required this.status,
      required this.Deadline,
      required this.createDate,
});
}
