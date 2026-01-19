import 'package:dayflow/features/tasks/domain/entities/task.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final DateTime startTime;
  @HiveField(5)
  final DateTime endTime;
  @HiveField(6)
  final DateTime? actualStartTime;
  @HiveField(7)
  final DateTime? actualEndTime;
  @HiveField(8)
  final String priority; // Stored as string to simplify
  @HiveField(9)
  final String category; // Stored as string
  @HiveField(10)
  final String status;   // Stored as string
  @HiveField(11)
  final bool isRecurring;
  @HiveField(12)
  final String? recurrenceRule;
  @HiveField(13)
  final DateTime createdAt;
  @HiveField(14)
  final DateTime updatedAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.actualStartTime,
    this.actualEndTime,
    required this.priority,
    required this.category,
    required this.status,
    required this.isRecurring,
    this.recurrenceRule,
    required this.createdAt,
    required this.updatedAt,
  });

  // Mapper methods
  factory TaskModel.fromEntity(Task task) {
    return TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      date: task.date,
      startTime: task.startTime,
      endTime: task.endTime,
      actualStartTime: task.actualStartTime,
      actualEndTime: task.actualEndTime,
      priority: task.priority.name,
      category: task.category.name,
      status: task.status.name,
      isRecurring: task.isRecurring,
      recurrenceRule: task.recurrenceRule,
      createdAt: task.createdAt,
      updatedAt: task.updatedAt,
    );
  }

  Task toEntity() {
    return Task(
      id: id,
      title: title,
      description: description,
      date: date,
      startTime: startTime,
      endTime: endTime,
      actualStartTime: actualStartTime,
      actualEndTime: actualEndTime,
      priority: TaskPriority.values.firstWhere((e) => e.name == priority),
      category: TaskCategory.values.firstWhere((e) => e.name == category),
      status: TaskStatus.values.firstWhere((e) => e.name == status),
      isRecurring: isRecurring,
      recurrenceRule: recurrenceRule,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
