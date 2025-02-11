import 'package:build_with_mary/pages/kanban_board_page.dart';
import 'package:build_with_mary/pages/main_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => MainPage()),
    GoRoute(path: '/kanban', builder: (context, state) => KanbanBoardPage()),
  ],
);
