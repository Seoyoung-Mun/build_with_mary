import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("뚜벅뚜벅 프론트엔드 개발자 문서영"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "안녕하세요! 문서영입니다. Flutter와 Vue.js를 활용한 웹/앱 프론트엔드 개발을 전문으로 합니다.\n"
              "UI/UX 최적화와 성능 개선에 관심이 많으며, 사용자 친화적인 인터페이스를 구현하는 것을 좋아합니다.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "주요 기술 스택:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text("- Flutter, Vue.js, TypeScript, JavaScript, HTML, CSS"),
            const Text("- Firebase, Supabase, Node.js"),
            const Text("- UI/UX 디자인 및 최적화"),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.go('/kanban');
                },
                child: const Text("Flutter 칸반보드"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
