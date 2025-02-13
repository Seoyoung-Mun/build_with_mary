import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:build_with_mary/models/task.dart';
import 'package:build_with_mary/models/task_status_enum.dart';

class TaskProvider extends ChangeNotifier {
  // Task 임시데이터
  List<Task> _tasks = [
    Task(title: "할 일 1", description: "설명", status: TaskStatus.todo),
    Task(title: "급한 일 1", description: "설명", status: TaskStatus.urgent),
    Task(title: "진행 중 작업", description: "설명", status: TaskStatus.inProgress),
  ];

  List<Task> get tasks => UnmodifiableListView(_tasks);

  // 새로운 Task 추가
  void addTask(Task task) {
    _tasks.add(task);

    notifyListeners();
  }

  // 특정 Task 상태 업데이트
  void updateTaskStatus(int index, TaskStatus newStatus) {
    _tasks[index].status = newStatus;

    notifyListeners();
  }

  // Task 삭제
  void deleteTask(int index) {
    _tasks.removeAt(index);

    notifyListeners();
  }

  List<Task> getCurrentStatusTask(TaskStatus status) {
    return tasks.where((task) => task.status == status).toList();
  }
}