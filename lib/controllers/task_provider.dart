import 'dart:collection';
import 'package:build_with_mary/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:build_with_mary/models/task.dart';
import 'package:build_with_mary/models/task_status_enum.dart';

class TaskProvider extends ChangeNotifier {
  final _firestoreService = FirestoreService();
  List<Task> _tasks = [];

  List<Task> get tasks => UnmodifiableListView(_tasks);

  // 새로운 Task 추가
  void addTask(Task task) {
    _firestoreService.createTask(task);
    _tasks.add(task);
    notifyListeners();
  }

  // 모든 Task 가져오기
  void fetchTasks() async {
    print("📢 Firestore에서 Task 불러오는 중...");
    _tasks = await _firestoreService.fetchAllTasks();
    notifyListeners(); // UI 업데이트
    print("✅ Task 불러오기 완료: ${_tasks.length}개");
  }

  // 특정 Task 상태만 업데이트
  void updateTaskStatus(int index, TaskStatus newStatus) {
    _tasks[index].status = newStatus;

    notifyListeners();
  }

  // 특정 Task 수정사항 업데이트
  void updateTask (Task task) {
    _tasks[_tasks.indexWhere((taskElement) => taskElement.taskId == task.taskId)] = task;
    //db호출
    notifyListeners();

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