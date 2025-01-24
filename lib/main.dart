import 'package:flutter/material.dart';
import 'package:build_with_mary/pages/KanbanBoard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KanbanBoard(),
    );
  }
}


