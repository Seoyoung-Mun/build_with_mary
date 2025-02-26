import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

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
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          const SizedBox(height: 15),
          const Text(
            'Web/App Frontend Developer',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          /// 이메일 정보
          const Align(
            alignment: Alignment.center,
            child: Text(
              '📧 Email',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text('webdeveloper.sy@gmail.com'),
          ),
          const SizedBox(height: 12),

          /// 깃허브 정보
          const Align(
            alignment: Alignment.center,
            child: Text(
              '🐱 Github',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          GestureDetector(
            onTap: () => _launchURL('https://github.com/Seoyoung-Mun'),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'github.com/Seoyoung-Mun',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
          ),
          const SizedBox(height: 12),

          /// 블로그 정보
          const Align(
            alignment: Alignment.center,
            child: Text(
              '📚 Blog',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          GestureDetector(
            onTap: () => _launchURL('https://candoeverything-mary.tistory.com'),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'candoeverything-mary.tistory.com',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('- Frontend: HTML, CSS, JavaScript, Vue.js, React'),
            Text('- Backend: Node.js, Express, C#'),
            Text('- App: Flutter, Dart, Firebase'),
            Text('- DevOps: MySQL, MSSQL, Naver Cloud Platform'),
          ],
        ),
        SizedBox(height: 15),
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

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectTile(
              title: 'Flutter 프로젝트 - 칸반보드 이동하기',
              // githubUrl: 'https://github.com/example/flutter-project',
              routerString: '/kanban',
            ),
          ],
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
