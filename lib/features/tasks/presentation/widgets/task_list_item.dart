import 'package:dayflow/core/constants/app_colors.dart';
import 'package:dayflow/features/tasks/domain/entities/task.dart';
import 'package:dayflow/features/tasks/presentation/providers/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class TaskListItem extends ConsumerWidget {
  final Task task;
  final VoidCallback? onTap;

  const TaskListItem({super.key, required this.task, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(dailyTasksProvider(task.date).notifier);

    return Slidable(
      key: ValueKey(task.id),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              notifier.rescheduleTask(
                task,
                task.date.add(const Duration(days: 1)),
              );
            },
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            icon: Icons.calendar_today, // or Icons.next_plan if available
            label: 'Tomorrow',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              notifier.deleteTask(task);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        color: Theme.of(context).cardTheme.color,
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Priority Indicator
                Container(
                  width: 4,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _getPriorityColor(task.priority),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 12),

                // Task Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration: task.status == TaskStatus.completed
                              ? TextDecoration.lineThrough
                              : null,
                          color: task.status == TaskStatus.completed
                              ? AppColors.textSecondaryLight
                              : null,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: AppColors.textSecondaryLight,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${DateFormat.jm().format(task.startTime)} - ${DateFormat.jm().format(task.endTime)}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Actions
                if (task.status == TaskStatus.inProgress)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.timelapse,
                          size: 14,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'In Progress',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                if (task.status == TaskStatus.planned)
                  IconButton(
                    icon: const Icon(
                      Icons.play_circle_outline,
                      color: AppColors.primary,
                      size: 32,
                    ),
                    onPressed: () {
                      notifier.startTask(task);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Started "${task.title}"'),
                          duration: const Duration(milliseconds: 1500),
                        ),
                      );
                    },
                    tooltip: 'Start Task',
                  ),

                if (task.status == TaskStatus.planned ||
                    task.status == TaskStatus.inProgress)
                  IconButton(
                    icon: const Icon(
                      Icons.check_circle_outline,
                      color: AppColors.textSecondaryLight,
                      size: 32,
                    ),
                    onPressed: () => notifier.toggleStatus(task),
                    tooltip: 'Mark Complete',
                  )
                else if (task.status == TaskStatus.completed)
                  IconButton(
                    icon: const Icon(
                      Icons.check_circle,
                      color: AppColors.success,
                      size: 32,
                    ),
                    onPressed: () => notifier.toggleStatus(task),
                    tooltip: 'Mark Incomplete',
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getPriorityColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.high:
        return AppColors.priorityHigh;
      case TaskPriority.medium:
        return AppColors.priorityMedium;
      case TaskPriority.low:
        return AppColors.priorityLow;
    }
  }

  Widget _buildStatusIcon(TaskStatus status) {
    switch (status) {
      case TaskStatus.completed:
        return const Icon(Icons.check_circle, color: AppColors.success);
      case TaskStatus.missed:
        return const Icon(Icons.error, color: AppColors.error);
      case TaskStatus.inProgress:
        return const Icon(Icons.play_circle, color: AppColors.primary);
      default:
        return const Icon(Icons.circle_outlined, color: Colors.grey);
    }
  }
}
