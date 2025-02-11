import 'package:flutter/material.dart';
import 'package:build_with_mary/models/task_status_enum.dart';
import 'package:build_with_mary/models/task.dart';
import 'package:build_with_mary/widgets/task_card.dart';

class KanbanBoard extends StatelessWidget {
  final TaskStatus status;
  final List<Task> tasks;

  const KanbanBoard({super.key, required this.status, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              status.kor,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(task: tasks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
