import 'package:dayflow/core/database/database_provider.dart';
import 'package:dayflow/features/tasks/domain/repositories/task_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'task_repository_impl.dart';

part 'task_repository_provider.g.dart';

@riverpod
TaskRepository taskRepository(TaskRepositoryRef ref) {
  final box = ref.watch(tasksBoxProvider);
  return TaskRepositoryImpl(box);
}
