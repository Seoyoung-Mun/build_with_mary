import 'package:flutter/material.dart';
import 'package:build_with_mary/models/task_status_enum.dart';
import 'package:build_with_mary/models/task.dart';

class TaskDialog extends StatefulWidget {
  final Task? initialTask;
  final Function(Task) onSave;

  const TaskDialog({
    Key? key,
    this.initialTask,
    required this.onSave,
  }) : super(key: key);

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _deadlineDateController;
  TaskStatus _status = TaskStatus.todo;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: widget.initialTask?.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.initialTask?.description ?? '');
    _selectedDate = widget.initialTask?.deadlineDate;
    _status = widget.initialTask?.status ?? TaskStatus.todo;
    _deadlineDateController = TextEditingController(
      text: _selectedDate != null
          ? "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}"
          : '',
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _deadlineDateController.dispose();
    super.dispose();
  }

  // 📅 날짜 선택기 (모달 팝업)
  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _deadlineDateController.text =
            "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialTask == null ? '일정 추가' : '일정 수정'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: '제목'),
                validator: (value) =>
                    value == null || value.isEmpty ? '제목을 입력하세요' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: '내용'),
                validator: (value) =>
                    value == null || value.isEmpty ? '내용을 입력하세요' : null,
              ),
              const SizedBox(height: 10),

              // 📅 날짜 입력 필드 (터치 시 DatePicker 모달 팝업)
              TextFormField(
                controller: _deadlineDateController,
                decoration: InputDecoration(
                  labelText: '날짜 선택 (YYYY-MM-DD)',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.blue),
                    onPressed: () => _pickDate(context),
                  ),
                ),
                readOnly: true, // 키보드 입력 방지 (클릭 시 DatePicker만 열리게 함)
              ),

              const SizedBox(height: 10),
              DropdownButtonFormField<TaskStatus>(
                value: _status,
                decoration: const InputDecoration(labelText: '상태'),
                items: TaskStatus.values.map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status.kor),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _status = value ?? TaskStatus.todo;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('취소'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              widget.onSave(
                Task(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  status: _status,
                  deadlineDate: _selectedDate,
                  createDate: DateTime.now(),
                ),
              );
              Navigator.of(context).pop();
            }
          },
          child: const Text('저장'),
        ),
      ],
    );
  }
}
