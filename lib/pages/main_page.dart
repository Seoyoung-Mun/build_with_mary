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

//
// import 'package:flutter/material.dart';
//
//
//
class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('문서영 | 뚜벅뚜벅 웹 풀스택 개발자'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSection(),
            Divider(),
            SkillsSection(),
            Divider(),
            ProjectsSection(),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/profile.jpg'), // 프로필 이미지 추가 필요
        ),
        SizedBox(height: 10),
        Text(
          'Web/App Frontend Developer',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text('📧 Email: webdeveloper.sy@gmail.com'),
        Text('🐱 Github: github.com/Seoyoung-Mun'),
        Text('📚 Blog: candoeverything-mary.tistory.com'),
      ],
    );
  }
}

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🛠️ Skills',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('- Frontend: HTML, CSS, JavaScript, Vue.js, React'),
        Text('- Backend: Node.js, Express, C#'),
        Text('- App: Flutter, Dart, Firebase'),
        Text('- DevOps: MySQL, MSSQL, Naver Cloud Platform'),
      ],
    );
  }
}

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📂 Projects',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ProjectTile(
          title: 'Flutter 프로젝트',
          githubUrl: 'https://github.com/example/flutter-project',
        ),
        ProjectTile(
          title: 'Vue.js 기반 웹 프로젝트',
          githubUrl: 'https://github.com/example/vue-project',
        ),
      ],
    );
  }
}

class ProjectTile extends StatelessWidget {
  final String title;
  final String githubUrl;

  ProjectTile({required this.title, required this.githubUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(githubUrl, style: TextStyle(color: Colors.blue)),
      onTap: () {}, // 클릭 시 GitHub 페이지로 이동하도록 구현 가능
    );
  }
}