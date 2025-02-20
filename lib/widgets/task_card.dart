import 'package:build_with_mary/widgets/task_dialog.dart';
import 'package:flutter/material.dart';
import 'package:build_with_mary/models/task.dart';


class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    String? deadLineDateString;
    if (task.deadlineDate == null) {
      deadLineDateString = '-';
    } else {
      deadLineDateString =
      '${task.deadlineDate!.year}-${task.deadlineDate!.month}-${task.deadlineDate!.day}';
    }

    return Draggable<Task>(
      data: task, // 드래그 시 전달할 데이터 (Task)
      feedback: Material(
        child: Card(
          color: Colors.blueAccent.withOpacity(0.7),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(task.title, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ),
      childWhenDragging: Opacity(opacity: 0.5, child: _buildTaskCard(context)),
      child: _buildTaskCard(context),
    );
  }

  Widget _buildTaskCard(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: ListTile(
        title: Text(task.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(task.description),
        trailing: Text(
          task.deadlineDate != null
              ? '${task.deadlineDate!.year}-${task.deadlineDate!.month}-${task.deadlineDate!.day}'
              : '-',
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => TaskDialog(
              initialTask: task,
            ),
          );
        },
      ),
    );
  }
}
