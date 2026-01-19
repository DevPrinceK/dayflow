import 'package:dayflow/core/constants/app_colors.dart';
import 'package:dayflow/features/tasks/domain/entities/task.dart';
import 'package:dayflow/features/tasks/presentation/providers/tasks_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Last 7 Days',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildWeeklyChart(ref),
            const SizedBox(height: 32),
            const Text(
              'Today\'s Priority',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildPriorityBreakdown(ref),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyChart(WidgetRef ref) {
    final weeklyAsync = ref.watch(weeklyTasksProvider);

    return weeklyAsync.when(
      data: (tasks) {
        final now = DateTime.now();
        List<MapEntry<String, int>> dailyStats = [];

        // Calculate last 7 days stats
        for (int i = 6; i >= 0; i--) {
          final date = now.subtract(Duration(days: i));
          // Filter tasks for this specific date
          final dayTasks = tasks.where((t) {
            return t.date.year == date.year &&
                t.date.month == date.month &&
                t.date.day == date.day;
          }).toList();

          final completedCount = dayTasks
              .where((t) => t.status == TaskStatus.completed)
              .length;

          dailyStats.add(MapEntry(DateFormat.E().format(date), completedCount));
        }

        // Find max Y for chart scaling
        int maxCompleted = dailyStats
            .map((e) => e.value)
            .fold(0, (p, c) => p > c ? p : c);
        // Ensure at least some height
        if (maxCompleted < 5) maxCompleted = 5;

        return Container(
          height: 220,
          padding: const EdgeInsets.only(right: 16, top: 16, bottom: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceEvenly,
              maxY: maxCompleted.toDouble(),
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (_) => AppColors.primary,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    return BarTooltipItem(
                      '${rod.toY.toInt()} tasks',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value < 0 || value >= dailyStats.length)
                        return const SizedBox();
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          dailyStats[value.toInt()].key,
                          style: const TextStyle(
                            color: AppColors.textSecondaryLight,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                    reservedSize: 30, // Space for labels
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    interval: 1, // Only integer steps
                    getTitlesWidget: (value, meta) {
                      if (value % 1 != 0) return const SizedBox();
                      return Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          color: AppColors.textSecondaryLight,
                          fontSize: 10,
                        ),
                      );
                    },
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 1,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: AppColors.textSecondaryLight.withOpacity(0.1),
                    strokeWidth: 1,
                  );
                },
              ),
              borderData: FlBorderData(show: false),
              barGroups: dailyStats.asMap().entries.map((entry) {
                final index = entry.key;
                final count = entry.value.value;
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: count.toDouble(),
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryDark],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      width: 16,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(6),
                      ),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: maxCompleted.toDouble(),
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        );
      },
      loading: () => const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, s) =>
          SizedBox(height: 200, child: Center(child: Text('Error: $e'))),
    );
  }

  Widget _buildPriorityBreakdown(WidgetRef ref) {
    // Analyze Today's Tasks
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tasksAsync = ref.watch(dailyTasksProvider(today));

    return tasksAsync.when(
      data: (tasks) {
        if (tasks.isEmpty) return const Text("No tasks today.");

        int completed = tasks
            .where((t) => t.status == TaskStatus.completed)
            .length;
        int total = tasks.length;
        double percentage = total == 0 ? 0 : (completed / total) * 100;

        return Column(
          children: [
            Text(
              'Today\'s Completion: ${percentage.toStringAsFixed(1)}%',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 1.3,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                      color: AppColors.success,
                      value: completed.toDouble(),
                      title: '$completed',
                      radius: 50,
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      color: AppColors.textSecondaryLight,
                      value: (total - completed).toDouble(),
                      title: '${total - completed}',
                      radius: 50,
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, color: AppColors.success, size: 12),
                SizedBox(width: 4),
                Text('Completed'),
                SizedBox(width: 16),
                Icon(
                  Icons.circle,
                  color: AppColors.textSecondaryLight,
                  size: 12,
                ),
                SizedBox(width: 4),
                Text('Remaining'),
              ],
            ),
          ],
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => const Text('Error loading stats'),
    );
  }
}
