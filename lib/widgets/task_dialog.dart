import 'package:flutter/material.dart';

class TaskDialog extends StatefulWidget {
  final Map<String, dynamic>? initialData;
  final Function(Map<String, dynamic>) onSave;

  const TaskDialog({
    Key? key,
    this.initialData,
    required this.onSave,
  }) : super(key: key);

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late TextEditingController _dateController;
  String _status = "할 일";

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialData?['title'] ?? '');
    _contentController = TextEditingController(text: widget.initialData?['content'] ?? '');
    _dateController = TextEditingController(text: widget.initialData?['date'] ?? '');
    _status = widget.initialData?['status'] ?? "할 일";
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialData == null ? '일정 추가' : '일정 수정'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: '제목'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제목을 입력하세요';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(labelText: '내용'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '내용을 입력하세요';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: '날짜 (YYYY-MM-DD)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '날짜를 입력하세요';
                  }
                  // Optional: Add more date validation here
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _status,
                decoration: InputDecoration(labelText: '상태'),
                items: ["할 일", "급한 일", "진행 중", "완료한 일"]
                    .map((status) => DropdownMenuItem(
                  value: status,
                  child: Text(status),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _status = value ?? "할 일";
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
          child: Text('취소'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              widget.onSave({
                'title': _titleController.text,
                'content': _contentController.text,
                'date': _dateController.text,
                'status': _status,
              });
              Navigator.of(context).pop();
            }
          },
          child: Text('저장'),
        ),
      ],
    );
  }
}
