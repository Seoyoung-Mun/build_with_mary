import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:build_with_mary/models/task_status_enum.dart';
import 'package:build_with_mary/models/task.dart';
import 'package:build_with_mary/widgets/task_card.dart';
import 'package:build_with_mary/controllers/task_provider.dart';

class KanbanBoard extends StatelessWidget {
  final TaskStatus status;
  final List<Task> tasks;

  const KanbanBoard({super.key, required this.status, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return DragTarget<Task>(
      onAcceptWithDetails: (details) {
        // Task가 해당 보드에 드롭되었을 때 상태 변경
        final task = details.data;
        int index = taskProvider.tasks.indexWhere((t) => t.taskId == task.taskId);
        if (index != -1) {
          taskProvider.updateTaskStatus(index, status);
          print("Task가 ${status.kor} 보드로 이동 완료");
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: candidateData.isEmpty ? Colors.grey[200] : Colors.blue[100], // 드롭 가능 시 색상 변경
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
      },
    );
  }
}
