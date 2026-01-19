import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart'; // Optional: if we want JSON serialization for API later

enum TaskPriority { high, medium, low }
enum TaskStatus { planned, inProgress, completed, missed }
enum TaskCategory { work, study, personal, health, other }

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    @Default('') String description,
    required DateTime date,
    required DateTime startTime,
    required DateTime endTime,
    DateTime? actualStartTime,
    DateTime? actualEndTime,
    @Default(TaskPriority.medium) TaskPriority priority,
    @Default(TaskCategory.other) TaskCategory category,
    @Default(TaskStatus.planned) TaskStatus status,
    @Default(false) bool isRecurring,
    String? recurrenceRule,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
