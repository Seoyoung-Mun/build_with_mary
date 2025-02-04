class Task {
  int? taskId;
  String title;
  String description;
  String status;//todo: jh: enum type으로 변환
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
  //todo: jh: fromMap-> factory constructor 이용, toMap method이용해서 구현
}
