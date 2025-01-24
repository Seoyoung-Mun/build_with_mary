import 'package:flutter/material.dart';

class KanbanBoard extends StatelessWidget {
  final List<String> boards = ["할 일", "급한 일", "진행 중", "완료한 일"];
  final Map<String, List<Map<String, dynamic>>> boardCards = {
    "할 일": [
      {"title": "Flutter 공부", "content": "칸반보드 구현하기", "date": "2025-01-25", "status": "할 일"},
      {"title": "서점 가기", "content": "책 구매", "date": "2025-01-26", "status": "할 일"},
    ],
    "급한 일": [
      {"title": "과제 제출", "content": "BMB801 과제", "date": "2025-01-24", "status": "급한 일"},
    ],
    "진행 중": [
      {"title": "운동하기", "content": "헬스장 가기", "date": "2025-01-23", "status": "진행 중"},
    ],
    "완료한 일": [
      {"title": "장보기", "content": "마트에서 식료품 구매", "date": "2025-01-22", "status": "완료한 일"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('칸반 보드 일정 관리'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: boards.map((board) {
            return Expanded(
              child: Card(
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
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                            child: ListTile(
                              title: Text(card['title']),
                              subtitle: Text('${card['content']}\n날짜: ${card['date']}'),
                              isThreeLine: true,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
