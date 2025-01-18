import 'package:cloud_firestore/cloud_firestore.dart';

class ExperimentModel {
  final String id;
  final String title;
  final String objective;
  final List<String> tools;
  final List<String> steps;
  final DateTime? timeline;
  final String status;
  final String? observations;
  final String? results;
  final String? notes;
  final String userId;

  const ExperimentModel({
    required this.id,
    required this.title,
    required this.objective,
    required this.tools,
    required this.steps,
    this.timeline,
    required this.status,
    this.observations,
    this.results,
    this.notes,
    required this.userId,
  });

  // Create empty experiment
  static ExperimentModel empty() => const ExperimentModel(
        id: '',
        title: '',
        objective: '',
        tools: [],
        steps: [],
        status: '',
        userId: '',
      );

  // Convert model to JSON for Firebase
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'objective': objective,
      'tools': tools,
      'steps': steps,
      'timeline': timeline,
      'status': status,
      'observations': observations,
      'results': results,
      'notes': notes,
      'userId': userId,
    };
  }

  // Factory method to create ExperimentModel from Firebase document
  factory ExperimentModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ExperimentModel(
      id: document.id,
      title: data['title'] ?? '',
      objective: data['objective'] ?? '',
      tools: List<String>.from(data['tools'] ?? []),
      steps: List<String>.from(data['steps'] ?? []),
      timeline: (data['timeline'] as Timestamp?)?.toDate(),
      status: data['status'] ?? '',
      observations: data['observations'],
      results: data['results'],
      notes: data['notes'],
      userId: data['userId'] ?? '',
    );
  }
}
