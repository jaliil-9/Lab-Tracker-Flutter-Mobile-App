import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../authentication/authentication_repository.dart';
import '../../../features/data management/models/task_model.dart';
import '../../../utils/helpers/loaders.dart';

class TaskRepository extends GetxController {
  static TaskRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _auth = AuthenticationRepository.instance;

  // Fetch tasks for current user
  Future<List<TaskModel>> getAllUserTasks() async {
    final user = _auth.authUser;
    if (user != null) {
      final snapshot = await _db
          .collection('tasks')
          .where('userId', isEqualTo: user.uid)
          .get();
      return snapshot.docs.map((doc) => TaskModel.fromSnapshot(doc)).toList();
    }
    return [];
  }

  // Add new task
  Future<void> addTask(TaskModel task) async {
    try {
      await _db.collection('tasks').add(task.toJson());
    } catch (e) {
      JBLoaders.errorSnackBar(
          title: 'Oops..', message: 'Something went wrong while adding task');
    }
  }

  // Update task
  Future<void> updateTask(TaskModel task) async {
    try {
      await _db.collection('tasks').doc(task.id).update(task.toJson());
    } catch (e) {
      JBLoaders.errorSnackBar(
          title: 'Oops..', message: 'Something went wrong while updating task');
    }
  }

  // Delete task
  Future<void> deleteTask(String taskId) async {
    try {
      await _db.collection('tasks').doc(taskId).delete();
    } catch (e) {
      JBLoaders.errorSnackBar(
          title: 'Oops..', message: 'Something went wrong while deleting task');
    }
  }
}
