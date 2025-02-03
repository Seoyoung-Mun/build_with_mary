import 'package:flutter/material.dart';
import '../widgets/task_dialog.dart';

void main() {
  runApp(KanbanApp());
}

class KanbanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 제거
      home: KanbanBoard(),
    );
  }
}

class KanbanBoard extends StatefulWidget {
  @override
  _KanbanBoardState createState() => _KanbanBoardState();
}

class _KanbanBoardState extends State<KanbanBoard> {
  final List<String> boards = ["할 일", "급한 일", "진행 중", "완료한 일"];

  final Map<String, List<Map<String, dynamic>>> boardCards = {
    "할 일": [
      {
        "title": "Flutter 공부",
        "description": "칸반보드 구현하기",
        "date": "2025-01-25",
        "status": "할 일"
      },
      {
        "title": "서점 가기",
        "description": "책 구매",
        "date": "2025-01-26",
        "status": "할 일"
      },
    ],
    "급한 일": [
      {
        "title": "과제 제출",
        "description": "BMB801 과제",
        "date": "2025-01-24",
        "status": "급한 일"
      },
    ],
    "진행 중": [
      {
        "title": "운동하기",
        "description": "헬스장 가기",
        "date": "2025-01-23",
        "status": "진행 중"
      },
    ],
    "완료한 일": [
      {
        "title": "장보기",
        "description": "마트에서 식료품 구매",
        "date": "2025-01-22",
        "status": "완료한 일"
      },
    ],
  };

  void _showTaskDialog(
      {Map<String, dynamic>? initialData, required String board}) {
    showDialog(
      context: context,
      builder: (context) => TaskDialog(
        initialData: initialData, // 수정할 때 데이터를 넘겨줌
        onSave: (data) {
          setState(() {
            if (initialData == null) {
              boardCards[board]!.add(data);
            } else {
              int index = boardCards[board]!.indexOf(initialData);
              boardCards[board]![index] = data;
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('칸반 보드 일정 관리'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialog(board: "할 일"),
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: boards.map((board) {
            return Expanded(
              child: DragTarget<Map<String, dynamic>>(
                onAcceptWithDetails: (DragTargetDetails<Map<String, dynamic>> details) {
                  final card = details.data;
                  setState(() {
                    String oldBoard = card['status'];
                    boardCards[oldBoard]!.remove(card);
                    card['status'] = board;
                    boardCards[board]!.add(card);
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          color: Colors.blue,
                          child: Text(
                            board,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: boardCards[board]?.length ?? 0,
                            itemBuilder: (context, index) {
                              final card = boardCards[board]![index];
                              return Draggable<Map<String, dynamic>>(
                                data: card,
                                feedback: Material(
                                  // 움직일 위젯
                                  child: Card(
                                    color: Colors.grey.shade200,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(card['title']),
                                    ),
                                  ),
                                ),
                                childWhenDragging: Opacity(
                                  // 남은 잔상: 움직이는 동안 투명도 조절
                                  opacity: 0.5,
                                  child: _buildTaskCard(card, board),
                                ),
                                child: _buildTaskCard(card, board),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> card, String board) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: ListTile(
        title: Text(card['title']),
        subtitle: Text('${card['description']}\n날짜: ${card['date']}'),
        isThreeLine: true,
        onTap: () => _showTaskDialog(initialData: card, board: board),
      ),
    );
  }
}
