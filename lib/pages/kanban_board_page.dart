import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:build_with_mary/controllers/task_provider.dart';
import 'package:build_with_mary/models/task_status_enum.dart';
import 'package:build_with_mary/widgets/kanban_board.dart';
import 'package:build_with_mary/widgets/task_dialog.dart';

class KanbanBoardPage extends StatefulWidget {
  const KanbanBoardPage({super.key});

  @override
  State<KanbanBoardPage> createState() => _KanbanBoardPageState();
}

class _KanbanBoardPageState extends State<KanbanBoardPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban 보드'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Padding(
          padding: const EdgeInsets.all(16.0),
          // child: Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => TaskDialog(),
                );
              },
              child: const Text(
                '일정등록',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        // ),
          Expanded(
            child: Consumer<TaskProvider>(
              builder: (context, taskProvider, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: TaskStatus.values.length,
                  itemBuilder: (context, index) {
                    final status = TaskStatus.fromIndex(index);
                    final filteredTasks = taskProvider.getCurrentStatusTask(status);

                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: KanbanBoard(
                          status: status,
                          tasks: filteredTasks,
                        ),
                      ),
                    );
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
