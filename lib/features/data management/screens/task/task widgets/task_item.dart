import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/features/data%20management/models/task_model.dart';
import 'package:lab_tracker_app/features/data%20management/screens/task/task%20widgets/task_detail.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final Function(TaskModel) onToggle;
  final Function(String) onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => TaskDetailScreen(task));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Checkbox(
              value: task.isCompleted,
              activeColor: secondaryColor,
              onChanged: (bool? value) {
                onToggle(task);
              },
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                      decoration:
                          task.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    task.description != null && task.description!.isNotEmpty
                        ? task.description!.length > 50
                            ? '${task.description!.substring(0, 50)}...'
                            : task.description!
                        : S.of(context).no_details_provided,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red, size: 30),
              onPressed: () {
                _showDeleteConfirmationDialog(context, task.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String taskId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).confirm_deletion),
          content: Text(S.of(context).are_you_sure_delete),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                S.of(context).delete,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                onDelete(taskId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
