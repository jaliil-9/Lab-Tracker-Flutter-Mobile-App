import 'package:get/get.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/tasks/task_repository.dart';
import '../models/task_model.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/helpers/loaders.dart';

class TaskController extends GetxController {
  static TaskController get instance => Get.find();

  final _taskRepo = Get.put(TaskRepository());
  final _authRepo = Get.put(AuthenticationRepository());

  // Observable states
  final tasks = <TaskModel>[].obs;
  final isAddingTask = false.obs;
  final isLoading = false.obs;

  // Getter for current user ID
  String get userId => _authRepo.authUser?.uid ?? '';

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  // Fetch tasks
  Future<void> fetchTasks() async {
    try {
      if (tasks.isEmpty) {
        isLoading.value = true;
      }
      final tasksList = await _taskRepo.getAllUserTasks();
      tasks.assignAll(tasksList);
    } catch (e) {
      JBLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Add task
  Future<void> addTask(TaskModel task) async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      isAddingTask.value = true;
      await _taskRepo.addTask(task);

      // Add the new task to the local list immediately
      tasks.add(task);

      // Fetch in background to ensure sync
      await fetchTasks();
    } catch (e) {
      JBLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isAddingTask.value = false;
    }
  }

  // Update task
  Future<void> updateTask(TaskModel task) async {
    try {
      await _taskRepo.updateTask(task);
      await fetchTasks();
    } catch (e) {
      JBLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  // Delete task
  Future<void> deleteTask(String taskId) async {
    try {
      await _taskRepo.deleteTask(taskId);
      await fetchTasks();
    } catch (e) {
      JBLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  // Toggle task completion
  Future<void> toggleTaskCompletion(TaskModel task) async {
    try {
      final updatedTask = TaskModel(
        id: task.id,
        title: task.title,
        description: task.description,
        deadline: task.deadline,
        isCompleted: !task.isCompleted,
        userId: task.userId,
      );
      await updateTask(updatedTask);
    } catch (e) {
      JBLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  // Search tasks
  List<TaskModel> searchTasks(String keyword) {
    return tasks
        .where(
            (task) => task.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  // Getters for task statistics
  int get totalTasks => tasks.length;
  int get completedTasks => tasks.where((task) => task.isCompleted).length;
  int get ongoingTasks => totalTasks - completedTasks;

  List<TaskModel> get recentActivities {
    final sortedTasks = tasks.where((task) => task.deadline != null).toList()
      ..sort((a, b) => b.deadline!.compareTo(a.deadline!));
    return sortedTasks.take(5).toList();
  }
}
