import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import '../controllers/task_controller.dart';
import '../controllers/experiment_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Text(
              S.of(context).dashboard_title,
              style: const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                S.of(context).welcome_message,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Combined Overview and Summary Card
            DashboardCard(
              title: S.of(context).overview_summary,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Top Section: Titles in the same line
                  Row(
                    children: [
                      // Task Overview Title
                      Expanded(
                        child: Text(
                          S.of(context).task_overview,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Experiment Overview Title
                      Expanded(
                        child: Text(
                          S.of(context).experiment_overview,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  const Row(
                    children: [
                      // Task Overview Section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TaskOverview(),
                          ],
                        ),
                      ),

                      // Experiment Overview Section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ExperimentOverview(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  const Row(
                    children: [
                      // Task Summary
                      Expanded(
                        child: TaskSummary(),
                      ),
                      SizedBox(width: 16),

                      // Experiment Summary
                      Expanded(
                        child: ExperimentSummary(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Remaining widgets stacked vertically
            DashboardCard(
              title: S.of(context).recent_activity,
              child: const RecentActivity(),
            ),
            const SizedBox(height: 16),
            DashboardCard(
              title: S.of(context).upcoming_deadlines,
              child: const UpcomingDeadlines(),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final Widget child;

  const DashboardCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: textSecondaryColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class TaskOverview extends StatelessWidget {
  const TaskOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();
    return Obx(() {
      double progress = taskController.totalTasks == 0
          ? 0
          : taskController.completedTasks / taskController.totalTasks;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            height: 7,
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${(progress * 100).toStringAsFixed(1)}${S.of(context).percentcompleted}',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      );
    });
  }
}

class ExperimentOverview extends StatelessWidget {
  const ExperimentOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final ExperimentController experimentController = Get.find();
    return Obx(() {
      int total = experimentController.totalExperiments;
      int completed = experimentController.completedExperiments;
      double progress = total == 0 ? 0 : completed / total;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 120.0,
              height: 120.0,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 8.0,
                    color: Colors.green,
                    backgroundColor: Colors.grey[300],
                  ),
                  Center(
                    child: Text(
                      '${(progress * 100).toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).progress,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      );
    });
  }
}

class TaskSummary extends StatelessWidget {
  const TaskSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).total,
                  style: DefaultTextStyle.of(context).style,
                ),
                TextSpan(
                  text: '${taskController.totalTasks}',
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).ongoing,
                  style: DefaultTextStyle.of(context).style,
                ),
                TextSpan(
                  text: '${taskController.ongoingTasks}',
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).completed,
                  style: DefaultTextStyle.of(context).style,
                ),
                TextSpan(
                  text: '${taskController.completedTasks}',
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class ExperimentSummary extends StatelessWidget {
  const ExperimentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final ExperimentController experimentController = Get.find();
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).total,
                  style: DefaultTextStyle.of(context).style,
                ),
                TextSpan(
                  text: '${experimentController.totalExperiments}',
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).ongoing,
                  style: DefaultTextStyle.of(context).style,
                ),
                TextSpan(
                  text: '${experimentController.ongoingExperiments}',
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).completed,
                  style: DefaultTextStyle.of(context).style,
                ),
                TextSpan(
                  text: '${experimentController.completedExperiments}',
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();
    final ExperimentController experimentController = Get.find();
    return Obx(() {
      final recentTasks = taskController.tasks.take(3).toList();
      final recentExperiments =
          experimentController.experiments.take(3).toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (recentTasks.isEmpty && recentExperiments.isEmpty)
            Text(S.of(context).no_recent_act,
                style: const TextStyle(color: Colors.grey)),
          ...recentTasks.map((task) {
            final deadlineText = task.deadline != null
                ? ' (${S.of(context).due}: ${task.deadline!.toLocal().toString().split(' ')[0]})'
                : '';
            return Text('*${S.of(context).task}: ${task.title}$deadlineText');
          }),
          ...recentExperiments.map((exp) {
            final timelineText = exp.timeline != null
                ? ' (${S.of(context).timeline}: ${exp.timeline!.toLocal().toString().split(' ')[0]})'
                : '';
            return Text(
                '*${S.of(context).experiment}: ${exp.title} (${exp.status})$timelineText');
          }),
        ],
      );
    });
  }
}

class UpcomingDeadlines extends StatelessWidget {
  const UpcomingDeadlines({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();
    final ExperimentController experimentController = Get.find();
    return Obx(() {
      final upcomingTasks = taskController.tasks
          .where((task) => task.deadline != null)
          .take(3)
          .toList();
      final upcomingExperiments = experimentController.experiments
          .where((exp) => exp.timeline != null)
          .take(3)
          .toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (upcomingTasks.isEmpty && upcomingExperiments.isEmpty)
            Text(S.of(context).no_upcoming_deads,
                style: const TextStyle(color: Colors.grey)),
          ...upcomingTasks.map((task) => Text(
              '*${S.of(context).task}: ${task.title} (${S.of(context).due}: ${task.deadline!.toLocal().toString().split(' ')[0]})')),
          ...upcomingExperiments.map((exp) => Text(
              '*${S.of(context).experiment}: ${exp.title} (${S.of(context).due}: ${exp.timeline!.toLocal().toString().split(' ')[0]})')),
        ],
      );
    });
  }
}
