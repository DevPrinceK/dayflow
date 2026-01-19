import 'package:dayflow/features/tasks/data/models/task_model.dart';
import 'package:dayflow/features/tasks/domain/entities/task.dart';
import 'package:dayflow/features/tasks/domain/repositories/task_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskRepositoryImpl implements TaskRepository {
  final Box<TaskModel> _box;

  TaskRepositoryImpl(this._box);

  @override
  Stream<List<Task>> watchTasks(DateTime date) {
    return _box
        .watch()
        .map((_) {
          return _filterTasksByDate(date);
        })
        .startWith(_filterTasksByDate(date));
  }

  @override
  Future<List<Task>> getTasks(DateTime date) async {
    return _filterTasksByDate(date);
  }

  @override
  Future<List<Task>> getTasksInRange(DateTime start, DateTime end) async {
    return _box.values
        .where((t) {
          final date = t.date;
          // Normalize to start of day for accurate comparison
          final d = DateTime(date.year, date.month, date.day);
          final s = DateTime(start.year, start.month, start.day);
          final e = DateTime(end.year, end.month, end.day);
          return (d.isAtSameMomentAs(s) || d.isAfter(s)) &&
              (d.isAtSameMomentAs(e) || d.isBefore(e));
        })
        .map((m) => m.toEntity())
        .toList();
  }

  @override
  Future<void> createTask(Task task) async {
    final model = TaskModel.fromEntity(task);
    await _box.put(model.id, model);
  }

  @override
  Future<void> updateTask(Task task) async {
    final model = TaskModel.fromEntity(task);
    await _box.put(model.id, model);
  }

  @override
  Future<void> deleteTask(String id) async {
    await _box.delete(id);
  }

  List<Task> _filterTasksByDate(DateTime date) {
    return _box.values
        .where((t) => isSameDay(t.date, date))
        .map((m) => m.toEntity())
        .toList();
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

extension StreamStartWith<T> on Stream<T> {
  Stream<T> startWith(T value) async* {
    yield value;
    yield* this;
  }
}
