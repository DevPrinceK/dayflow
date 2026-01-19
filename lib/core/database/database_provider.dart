import 'package:dayflow/features/tasks/data/models/task_model.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
Box<TaskModel> tasksBox(TasksBoxRef ref) {
  return Hive.box<TaskModel>('tasks');
}
