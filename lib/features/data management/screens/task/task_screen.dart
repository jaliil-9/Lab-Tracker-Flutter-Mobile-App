import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/features/data%20management/screens/task/task%20widgets/add_task_option.dart';
import 'package:lab_tracker_app/features/data%20management/screens/task/task%20widgets/quick_task_field.dart';
import 'package:lab_tracker_app/features/data%20management/screens/task/task%20widgets/task_item.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import 'package:lab_tracker_app/utils/constants/sizes.dart';
import 'package:lab_tracker_app/utils/widgets/search_bar.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import '../../controllers/task_controller.dart';
import 'task widgets/add_task_form.dart';

class TasksPage extends StatelessWidget {
  TasksPage({super.key});

  final TaskController taskController = Get.put(TaskController());
  final _quickTaskController = TextEditingController();
  final showQuickTaskField = false.obs;
  final isFabExpanded = false.obs;

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
              S.of(context).tasks_title,
              style: const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          showQuickTaskField.value = false;
        },
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(JBSizes.defaultSpace),
                child: Column(
                  children: [
                    MySearchBar(
                      onChanged: (value) => taskController.searchTasks(value),
                    ),
                    const SizedBox(height: JBSizes.spaceBtwSections),
                    Expanded(
                      child: Obx(
                        () {
                          if (taskController.isLoading.value) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (taskController.tasks.isEmpty) {
                            return Center(
                              child: Text(
                                S.of(context).add_new_task,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }

                          return Stack(
                            children: [
                              ListView.builder(
                                itemCount: taskController.tasks.length,
                                itemBuilder: (context, index) => TaskItem(
                                  task: taskController.tasks[index],
                                  onToggle: taskController.toggleTaskCompletion,
                                  onDelete: taskController.deleteTask,
                                ),
                              ),

                              // Loading indicator that appears on top
                              if (taskController.isAddingTask.value)
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          S.of(context).adding_task,
                                          style: const TextStyle(
                                              color: primaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              if (showQuickTaskField.value) {
                return Positioned(
                  bottom: 120,
                  right: 16,
                  left: 16,
                  child: QuickTaskField(
                    quickTaskController: _quickTaskController,
                    taskController: taskController,
                    showQuickTaskField: showQuickTaskField,
                    context: context,
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
      floatingActionButton: Obx(() => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (isFabExpanded.value) ...[
                AddTaskOption(
                    icon: Icons.task_alt,
                    label: S.of(context).quick_task,
                    onPressed: () {
                      showQuickTaskField.value = true;
                      isFabExpanded.value = false;
                    }),
                const SizedBox(height: JBSizes.spaceBtwItems),
                AddTaskOption(
                    icon: Icons.add,
                    label: S.of(context).heavy_task,
                    onPressed: () {
                      _showAddTaskForm();
                      isFabExpanded.value = false;
                    }),
                const SizedBox(height: JBSizes.spaceBtwItems),
              ],
              FloatingActionButton(
                onPressed: () {
                  isFabExpanded.value = !isFabExpanded.value;
                },
                backgroundColor: primaryColor,
                child: Icon(
                  isFabExpanded.value ? Icons.close : Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }

  void _showAddTaskForm() {
    Get.bottomSheet(
      Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
        child: const AddTaskForm(),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }
}
