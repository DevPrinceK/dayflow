import 'package:dayflow/core/constants/app_colors.dart';
import 'package:dayflow/features/tasks/domain/entities/task.dart';
import 'package:dayflow/features/tasks/presentation/providers/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class EditTaskScreen extends ConsumerStatefulWidget {
  final Task? task;
  final DateTime? initialDate;

  const EditTaskScreen({super.key, this.task, this.initialDate});

  @override
  ConsumerState<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends ConsumerState<EditTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime _selectedDate;
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;
  late TaskPriority _priority;
  late bool _isRecurring;
  String? _recurrenceRule;

  @override
  void initState() {
    super.initState();
    final task = widget.task;
    _titleController = TextEditingController(text: task?.title ?? '');
    _descriptionController = TextEditingController(
      text: task?.description ?? '',
    );
    _selectedDate = task?.date ?? widget.initialDate ?? DateTime.now();

    if (task != null) {
      _startTime = TimeOfDay.fromDateTime(task.startTime);
      _endTime = TimeOfDay.fromDateTime(task.endTime);
      _priority = task.priority;
      _isRecurring = task.isRecurring;
      _recurrenceRule = task.recurrenceRule;
    } else {
      final now = TimeOfDay.now();
      _startTime = TimeOfDay(hour: now.hour + 1, minute: 0); // Next hour
      _endTime = TimeOfDay(hour: now.hour + 2, minute: 0);
      _priority = TaskPriority.medium;
      _isRecurring = false;
      _recurrenceRule = 'daily';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(bool isStartTime) async {
    final initial = isStartTime ? _startTime : _endTime;
    final picked = await showTimePicker(context: context, initialTime: initial);

    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
          // Auto adjust end time if needed
          final startMinutes = _startTime.hour * 60 + _startTime.minute;
          final endMinutes = _endTime.hour * 60 + _endTime.minute;
          if (endMinutes <= startMinutes) {
            _endTime = TimeOfDay(
              hour: _startTime.hour + 1,
              minute: _startTime.minute,
            );
          }
        } else {
          _endTime = picked;
        }
      });
    }
  }

  Future<void> _saveTask() async {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a title')));
      return;
    }

    final now = DateTime.now();
    final startDateTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _startTime.hour,
      _startTime.minute,
    );
    final endDateTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _endTime.hour,
      _endTime.minute,
    );

    if (widget.task != null) {
      // Update
      final updatedTask = widget.task!.copyWith(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        date: _selectedDate,
        startTime: startDateTime,
        endTime: endDateTime,
        priority: _priority,
        isRecurring: _isRecurring,
        recurrenceRule: _isRecurring ? _recurrenceRule : null,
        updatedAt: now,
      );
      await ref
          .read(dailyTasksProvider(_selectedDate).notifier)
          .updateTask(updatedTask);
    } else {
      // Create
      final newTask = Task(
        id: const Uuid().v4(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        date: _selectedDate,
        startTime: startDateTime,
        endTime: endDateTime,
        priority: _priority,
        status: TaskStatus.planned,
        isRecurring: _isRecurring,
        recurrenceRule: _isRecurring ? _recurrenceRule : null,
        createdAt: now,
        updatedAt: now,
      );
      await ref
          .read(dailyTasksProvider(_selectedDate).notifier)
          .addTask(newTask);
    }

    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.task != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Task' : 'New Task'),
        actions: [
          IconButton(onPressed: _saveTask, icon: const Icon(Icons.check)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _buildTimeTile(
                    'Start',
                    _startTime,
                    () => _selectTime(true),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTimeTile(
                    'End',
                    _endTime,
                    () => _selectTime(false),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Priority',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SegmentedButton<TaskPriority>(
              segments: const [
                ButtonSegment(
                  value: TaskPriority.low,
                  label: Text('Low'),
                  icon: Icon(Icons.low_priority),
                ),
                ButtonSegment(
                  value: TaskPriority.medium,
                  label: Text('Medium'),
                  icon: Icon(Icons.sort),
                ),
                ButtonSegment(
                  value: TaskPriority.high,
                  label: Text('High'),
                  icon: Icon(Icons.priority_high),
                ),
              ],
              selected: {_priority},
              onSelectionChanged: (Set<TaskPriority> newSelection) {
                setState(() {
                  _priority = newSelection.first;
                });
              },
            ),
            const SizedBox(height: 24),
            SwitchListTile(
              title: const Text('Repeating Task'),
              subtitle: Text(
                _isRecurring
                    ? (_recurrenceRule == 'daily'
                          ? 'Repeats Daily'
                          : 'Repeats Weekly')
                    : 'Does not repeat',
              ),
              value: _isRecurring,
              onChanged: (val) {
                setState(() {
                  _isRecurring = val;
                  if (val && _recurrenceRule == null) {
                    _recurrenceRule = 'daily';
                  }
                });
              },
            ),
            if (_isRecurring)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButton<String>(
                  value: _recurrenceRule,
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: 'daily', child: Text('Daily')),
                    DropdownMenuItem(value: 'weekly', child: Text('Weekly')),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _recurrenceRule = val;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeTile(String label, TimeOfDay time, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              time.format(context),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
