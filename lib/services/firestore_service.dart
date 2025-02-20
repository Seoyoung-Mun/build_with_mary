import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirestoreService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;

  Future<void> createTask(Task task) async {
    print(task.toMap());
    final _tasksCollection = _fs.collection('Tasks');
    print('서비스 작동1');
    final docRef = await _tasksCollection.add(task.toMap());
    print('서비스 작동2');
    docRef.update({'taskId': docRef.id});
    print('서비스 작동3');
  }

  Future<Task> readTask(String taskId) async {
    final _tasksCollection = _fs.collection('Tasks');
    final docSnapshot = await _tasksCollection.doc(taskId).get();
    final mapData = docSnapshot.data()!;
    return Task.fromMap(mapData);
  }
}
