import 'package:flutter/material.dart';
import 'package:build_with_mary/routes/router.dart';

void main() {
  runApp(MyApp());
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