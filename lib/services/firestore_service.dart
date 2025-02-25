import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirestoreService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;

  Future<void> createTask(Task task) async {
    final _tasksCollection = _fs.collection('Tasks');
    final docRef = await _tasksCollection.add(task.toMap());
    docRef.update({'taskId': docRef.id});
  }

  //
  // Future<Task> readTask(String taskId) async {
  //   final _tasksCollection = _fs.collection('Tasks');
  //   final docSnapshot = await _tasksCollection.doc(taskId).get();
  //   final mapData = docSnapshot.data()!;
  //   return Task.fromMap(mapData);
  // }

  Future<List<Task>> fetchAllTasks() async {
    try {
      final _tasksCollection = _fs.collection('Tasks');

      final QuerySnapshot<
          Map<String, dynamic>> snapshot = await _tasksCollection
          .orderBy('deadlineDate') // deadline순 정렬
          // .orderBy('taskId') // ID 순 정렬
          .get();

      // 🔥 Firestore 문서를 Task 리스트로 변환
      List<Task> tasks = snapshot.docs.map((doc) {
        return Task.fromMap(doc.data());
      }).toList();

      print(" ${tasks.length}개의 Task 불러옴");
      return tasks;

    } catch (e) {
      print("⚠️ Firestore에서 Task 불러오기 실패: $e");
      return [];
    }
  }
}