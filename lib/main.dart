import 'package:build_with_mary/controllers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:build_with_mary/routes/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false, //디버그 배너 제거
    );
  }
}