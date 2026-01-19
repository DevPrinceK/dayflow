import '../entities/task.dart';

abstract class TaskRepository {
  Stream<List<Task>> watchTasks(DateTime date);
  Future<List<Task>> getTasks(DateTime date);
  Future<List<Task>> getTasksInRange(DateTime start, DateTime end);
  Future<void> createTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
}
