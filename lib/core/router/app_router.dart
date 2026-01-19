import 'package:dayflow/features/tasks/presentation/screens/analytics_screen.dart';
import 'package:dayflow/features/tasks/presentation/screens/edit_task_screen.dart';
import 'package:dayflow/features/tasks/presentation/screens/home_screen.dart';
import 'package:dayflow/features/tasks/presentation/screens/task_details_screen.dart';
import 'package:dayflow/features/tasks/domain/entities/task.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/analytics',
        builder: (context, state) => const AnalyticsScreen(),
      ),
      GoRoute(
        path: '/task-details',
        builder: (context, state) {
          final task = state.extra as Task;
          return TaskDetailsScreen(task: task);
        },
      ),
      GoRoute(
        path: '/edit-task',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final task = extra?['task'] as Task?;
          final initialDate = extra?['initialDate'] as DateTime?;
          return EditTaskScreen(task: task, initialDate: initialDate);
        },
      ),
    ],
  );
}
