import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import 'package:lab_tracker_app/utils/constants/sizes.dart';

import '../../../controllers/task_controller.dart';
import '../../../models/task_model.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final selectedDate = Rx<DateTime?>(null);
    final isCompleted = false.obs;

    return Container(
      padding: const EdgeInsets.all(JBSizes.defaultSpace),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: S.of(context).form_title,
              labelStyle: const TextStyle(color: secondaryColor),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: secondaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          ),
          const SizedBox(height: JBSizes.spaceBtwInputFields),

          // Description
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: S.of(context).form_description,
              labelStyle: const TextStyle(color: secondaryColor),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: secondaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          ),
          const SizedBox(height: JBSizes.spaceBtwItems),

          // Date
          Row(
            children: [
              Text(S.of(context).form_deadline),
              const SizedBox(width: JBSizes.spaceBtwItems),
              Expanded(
                child: Obx(
                  () => Text(
                    selectedDate.value == null
                        ? S.of(context).form_no_date_chosen
                        : selectedDate.value!
                            .toLocal()
                            .toString()
                            .split(' ')[0],
                  ),
                ),
              ),

              // Pick Date button
              ElevatedButton(
                onPressed: () => _selectDate(context, selectedDate),
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  S.of(context).form_choose_date,
                  style: const TextStyle(color: textSecondaryColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: JBSizes.spaceBtwItems),

          // Status
          Row(
            children: [
              Text(
                S.of(context).completed,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Obx(
                () => Switch(
                  value: isCompleted.value,
                  onChanged: (value) => isCompleted.value = value,
                  activeColor: secondaryColor,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[300],
                ),
              ),
            ],
          ),
          const SizedBox(height: JBSizes.spaceBtwSections),

          // Sy=ubmit data button
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                final task = TaskModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: titleController.text,
                  description: descriptionController.text,
                  deadline: selectedDate.value,
                  isCompleted: isCompleted.value,
                  userId: taskController.userId,
                );
                taskController.addTask(task);
                Get.back();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor,
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              S.of(context).form_add_task,
              style: const TextStyle(color: textSecondaryColor),
            ),
          ),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context, Rx<DateTime?> selectedDate) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(200),
      lastDate: DateTime(2100),
      builder: (ctx, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: secondaryColor,
            colorScheme: const ColorScheme.light(primary: secondaryColor),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }
}
