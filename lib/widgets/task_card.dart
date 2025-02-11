import 'package:build_with_mary/controllers/task_provider.dart';
import 'package:build_with_mary/widgets/task_dialog.dart';
import 'package:flutter/material.dart';
import 'package:build_with_mary/models/task.dart';
import 'package:provider/provider.dart';

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
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: ListTile(
        title: Text(task.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(task.description),
        trailing: Text(
          deadLineDateString,
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        onTap: () {
          //dialog 연결
          showDialog(
            context: context,
            builder: (context) => TaskDialog(
              initialTask: task,
              onSave: (updatedTask) {
                final taskProvider =
                    Provider.of<TaskProvider>(context, listen: false);
                int index = taskProvider.tasks.indexOf(task);
                taskProvider.updateTaskStatus(index, updatedTask.status);
              },
            ),
          );
        },
      ),
    );
  }
}
