import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileSection(),
            Divider(),
            SkillsSection(),
            Divider(),
            Center(child: ProjectsSection()),
            Divider()
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
          backgroundImage: AssetImage('assets/profile.jpg'), // 프로필 이미지
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '📂 Projects',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ProjectTile(
          title: 'Flutter 프로젝트 - 칸반보드 이동하기',
          // githubUrl: 'https://github.com/example/flutter-project',
          routerString: '/kanban',
        ),
        // ProjectTile(
        //   title: 'Flutter 프로젝트',
        //   githubUrl: 'https://github.com/example/flutter-project',
        // ),
        // ProjectTile(
        //   title: 'Vue.js 기반 웹 프로젝트',
        //   githubUrl: 'https://github.com/example/vue-project',
        // ),
      ],
    );
  }
}

class ProjectTile extends StatelessWidget {
  final String title;
  String? routerString;

  // final String githubUrl;

  ProjectTile({
    required this.title,
    this.routerString,
    // required this.githubUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center),
        // subtitle: Text(githubUrl, style: TextStyle(color: Colors.blue)),
        onTap: () {
          context.go('${routerString}');
        },
      ),
    );
  }
}
