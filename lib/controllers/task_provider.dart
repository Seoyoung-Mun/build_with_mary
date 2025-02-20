import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:build_with_mary/models/task.dart';
import 'package:build_with_mary/models/task_status_enum.dart';

class TaskProvider extends ChangeNotifier {
  // Task 임시데이터
  List<Task> _tasks = [
    Task(taskId: "1", title: "할 일 1", description: "설명", status: TaskStatus.todo),
    Task(taskId: "2", title: "급한 일 1", description: "설명", status: TaskStatus.urgent),
    Task(taskId: "3", title: "진행 중 작업", description: "설명", status: TaskStatus.inProgress),
  ];

  List<Task> get tasks => UnmodifiableListView(_tasks);

  // 새로운 Task 추가
  void addTask(Task task) {
    _tasks.add(task);
  //db호출
    notifyListeners();
  }

  // 특정 Task 상태 업데이트
  void updateTaskStatus(int index, TaskStatus newStatus) {
    _tasks[index].status = newStatus;

    notifyListeners();
  }

  // 특정 Task 수정사항 업데이트
  void updateTask (Task task) {
    _tasks[_tasks.indexWhere((taskElement) => taskElement.taskId == task.taskId)] = task;
    //db호출
    notifyListeners();
    print('updateTask provider 동작');
  }



  // Task 삭제
  void deleteTask(String taskId) {
    int index = _tasks.indexWhere((task) => task.taskId == taskId);
    _tasks.removeAt(index);
    //db호출
    notifyListeners();
  }

  List<Task> getCurrentStatusTask(TaskStatus status) {
    return tasks.where((task) => task.status == status).toList();
  }
}