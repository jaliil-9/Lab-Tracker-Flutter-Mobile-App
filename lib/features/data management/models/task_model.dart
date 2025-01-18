import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String id;
  final String title;
  final String? description;
  final DateTime? deadline;
  final bool isCompleted;
  final String userId;

  const TaskModel({
    required this.id,
    required this.title,
    this.description,
    this.deadline,
    this.isCompleted = false,
    required this.userId,
  });

  // Create empty task
  static TaskModel empty() => const TaskModel(
        id: '',
        title: '',
        userId: '',
      );

  // Convert model to Json structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'deadline': deadline,
      'isCompleted': isCompleted,
      'userId': userId,
    };
  }

  // Factory method to create TaskModel from Firebase document
  factory TaskModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TaskModel(
      id: document.id,
      title: data['title'] ?? '',
      description: data['description'],
      deadline: (data['deadline'] as Timestamp?)?.toDate(),
      isCompleted: data['isCompleted'] ?? false,
      userId: data['userId'] ?? '',
    );
  }
}
