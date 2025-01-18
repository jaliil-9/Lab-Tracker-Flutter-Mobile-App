import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/features/data%20management/controllers/task_controller.dart';
import 'package:lab_tracker_app/features/data%20management/models/task_model.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class QuickTaskField extends StatelessWidget {
  const QuickTaskField({
    super.key,
    required TextEditingController quickTaskController,
    required this.taskController,
    required this.showQuickTaskField,
    required this.context,
  }) : _quickTaskController = quickTaskController;

  final TextEditingController _quickTaskController;
  final TaskController taskController;
  final RxBool showQuickTaskField;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80,
      right: 16,
      left: 16,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.only(left: 16, bottom: 8, top: 8, right: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _quickTaskController,
                  decoration: InputDecoration(
                    hintText: S.of(context).enter_quick_task,
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, color: secondaryColor),
                onPressed: () {
                  if (_quickTaskController.text.isNotEmpty) {
                    final task = TaskModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      title: _quickTaskController.text,
                      userId: taskController.userId,
                    );
                    taskController.addTask(task);
                    _quickTaskController.clear();
                    showQuickTaskField.value = false;
                  }
                },
              ),
              IconButton(
                  onPressed: () {
                    _quickTaskController.clear(); // Clear the input field
                    showQuickTaskField.value = false; // Hide the input field
                  },
                  icon: const Icon(
                    Icons.cancel_rounded,
                    color: secondaryColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
