import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:dayflow/features/tasks/domain/entities/task.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Note: In a real app, you'd add iOS settings here too
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // Handle notification tap
      },
    );

    await _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    if (Platform.isAndroid) {
      await _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();
    }
  }

  Future<void> scheduleTaskNotifications(Task task) async {
    // 1. Task Start Alert (Exact time)
    await _scheduleNotification(
      id: task.id.hashCode, // Simple ID generation
      title: 'Time to start: ${task.title}',
      body:
          'It is ${task.startTime.hour}:${task.startTime.minute}. Let\'s get this done!',
      scheduledDate: task.startTime,
      channelId: 'task_start_channel',
      channelName: 'Task Start Alerts',
    );

    // 2. Task Reminder (e.g. 10 mins before - hardcoded for now, can be configurable)
    final reminderTime = task.startTime.subtract(const Duration(minutes: 10));
    if (reminderTime.isAfter(DateTime.now())) {
      await _scheduleNotification(
        id: task.id.hashCode + 1,
        title: 'Upcoming Task: ${task.title}',
        body: 'Starting in 10 minutes.',
        scheduledDate: reminderTime,
        channelId: 'task_reminder_channel',
        channelName: 'Task Reminders',
      );
    }

    // 3. About-to-Miss Alert (e.g. 15 mins before end time)
    final warningTime = task.endTime.subtract(const Duration(minutes: 15));
    if (warningTime.isAfter(DateTime.now()) &&
        warningTime.isAfter(task.startTime)) {
      await _scheduleNotification(
        id: task.id.hashCode + 2,
        title: '⚠️ About to miss: ${task.title}',
        body: 'Ends in 15 minutes. Mark as done or reschedule!',
        scheduledDate: warningTime,
        channelId: 'high_priority_channel',
        channelName: 'High Priority Alerts',
        importance: Importance.high,
        priority: Priority.high,
      );
    }
  }

  Future<void> _scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required String channelId,
    required String channelName,
    Importance importance = Importance.defaultImportance,
    Priority priority = Priority.defaultPriority,
  }) async {
    if (scheduledDate.isBefore(DateTime.now())) return;

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          channelName,
          importance: importance,
          priority: priority,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      // uiLocalNotificationDateInterpretation:
      //     UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelTaskNotifications(Task task) async {
    await _notificationsPlugin.cancel(task.id.hashCode);
    await _notificationsPlugin.cancel(task.id.hashCode + 1);
    await _notificationsPlugin.cancel(task.id.hashCode + 2);
  }
}

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});
