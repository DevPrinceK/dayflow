import 'package:dayflow/core/services/notification_service.dart';
import 'package:dayflow/features/tasks/data/repositories/task_repository_provider.dart';
import 'package:dayflow/features/tasks/domain/entities/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'tasks_provider.g.dart';

@riverpod
Future<List<Task>> weeklyTasks(WeeklyTasksRef ref) async {
  final now = DateTime.now();
  final end = DateTime(now.year, now.month, now.day);
  final start = end.subtract(const Duration(days: 6));
  return ref.read(taskRepositoryProvider).getTasksInRange(start, end);
}

@riverpod
class DailyTasks extends _$DailyTasks {
  @override
  Stream<List<Task>> build(DateTime date) {
    return ref.watch(taskRepositoryProvider).watchTasks(date);
  }

  Future<void> addTask(Task task) async {
    await ref.read(taskRepositoryProvider).createTask(task);
    await ref.read(notificationServiceProvider).scheduleTaskNotifications(task);
  }

  Future<void> updateTask(Task task) async {
    await ref.read(taskRepositoryProvider).updateTask(task);

    // Reschedule if not completed/missed
    if (task.status == TaskStatus.planned ||
        task.status == TaskStatus.inProgress) {
      await ref
          .read(notificationServiceProvider)
          .scheduleTaskNotifications(task);
    } else {
      await ref.read(notificationServiceProvider).cancelTaskNotifications(task);
    }
  }

  Future<void> deleteTask(Task task) async {
    await ref.read(taskRepositoryProvider).deleteTask(task.id);
    await ref.read(notificationServiceProvider).cancelTaskNotifications(task);
  }

  Future<void> rescheduleTask(Task task, DateTime newDate) async {
    final updated = task.copyWith(
      date: newDate,
      // Adjust start/end times if needed to match new date
      startTime: DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        task.startTime.hour,
        task.startTime.minute,
      ),
      endTime: DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        task.endTime.hour,
        task.endTime.minute,
      ),
    );
    await updateTask(updated);
  }

  Future<void> startTask(Task task) async {
    if (task.status != TaskStatus.planned) return;

    final updated = task.copyWith(
      status: TaskStatus.inProgress,
      actualStartTime: DateTime.now(),
    );
    await updateTask(updated);
  }

  Future<void> toggleStatus(Task task) async {
    final newStatus = task.status == TaskStatus.completed
        ? TaskStatus.planned
        : TaskStatus.completed;

    // Also set actual times if needed
    final updated = task.copyWith(
      status: newStatus,
      actualEndTime: newStatus == TaskStatus.completed ? DateTime.now() : null,
    );
    await updateTask(updated);

    // Handle Recurrence (Create next instance if completing)
    if (newStatus == TaskStatus.completed && task.isRecurring) {
      await _createNextRecurringInstance(task);
    }
  }

  Future<void> _createNextRecurringInstance(Task completedTask) async {
    // Determine next date
    DateTime nextDate = completedTask.date.add(const Duration(days: 1));
    if (completedTask.recurrenceRule == 'weekly') {
      nextDate = completedTask.date.add(const Duration(days: 7));
    }
    // 'daily' is default match for now

    // Check if task already exists for next date (simple duplicate check)
    // For now, we'll just create it. In a robust app, we'd check if overlapping ID exists or link them.

    final nextTask = completedTask.copyWith(
      id: const Uuid().v4(), // New ID
      date: nextDate,
      startTime: DateTime(
        nextDate.year,
        nextDate.month,
        nextDate.day,
        completedTask.startTime.hour,
        completedTask.startTime.minute,
      ),
      endTime: DateTime(
        nextDate.year,
        nextDate.month,
        nextDate.day,
        completedTask.endTime.hour,
        completedTask.endTime.minute,
      ),
      status: TaskStatus.planned,
      actualStartTime: null,
      actualEndTime: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // We must use the repository directly because 'this' provider is bound to the old date
    await ref.read(taskRepositoryProvider).createTask(nextTask);
    await ref
        .read(notificationServiceProvider)
        .scheduleTaskNotifications(nextTask);
  }
}
