import 'package:flutter/material.dart';
import 'package:lab_tracker_app/features/data%20management/models/task_model.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class TaskDetailScreen extends StatelessWidget {
  final TaskModel task;

  const TaskDetailScreen(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(task.title,
            style: const TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${S.of(context).form_description}:',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(task.description ?? S.of(context).no_desc_provided),
            const SizedBox(height: 20),
            Text(S.of(context).form_deadline,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(task.deadline == null
                ? S.of(context).no_deadline_set
                : task.deadline!.toLocal().toString().split(' ')[0]),
            const SizedBox(height: 20),
            Text('${S.of(context).progress}:',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(task.isCompleted
                ? S.of(context).completed2
                : S.of(context).not_completed),
          ],
        ),
      ),
    );
  }
}
