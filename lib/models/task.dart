import 'package:build_with_mary/models/task_status_enum.dart';

class Task {
  int? taskId;
  String title;
  String description;
  TaskStatus status; //todo-done: jh: enum type으로 변환
  DateTime? deadlineDate;
  DateTime? createDate;

  Task({
    this.taskId,
    required this.title,
    required this.description,
    required this.status,
    this.deadlineDate,
    this.createDate,
  });

  //todo: jh-done: fromMap-> factory constructor 이용, toMap method이용해서 구현

  //fromMap
  factory Task.fromMap(Map<String, dynamic> mapData) {
    late DateTime deadlineDate;
    if (mapData['deadlineDate'] == null) {
      deadlineDate = mapData['deadlineDate'];
    } else {
      deadlineDate = DateTime.fromMillisecondsSinceEpoch(
          mapData['deadlineDate'].seconds * 1000);
    }

    late DateTime createDate;
    if (mapData['createdDate'] == null) {
      createDate = mapData['createdDate'];
    } else {
      createDate = DateTime.fromMillisecondsSinceEpoch(
          mapData['createdDate'].seconds * 1000);
    }

    return Task(
      taskId: mapData['taskId'],
      title: mapData['title'],
      description: mapData['description'],
      status: TaskStatus.fromIndex(mapData['status']),
      deadlineDate: deadlineDate,
      createDate: createDate,
    );
  }

  //toMap
  Map<String, dynamic> toMap() {
    return {
      'taskId': taskId,
      'title': title,
      'description': description,
      'status': status.index,
      'deadlineDate': deadlineDate,
      'createDate': createDate,
    };
  }
}
