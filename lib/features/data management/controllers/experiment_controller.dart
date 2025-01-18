import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/experiments/experiment_repository.dart';
import '../models/experiment_model.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/helpers/loaders.dart';

class ExperimentController extends GetxController {
  static ExperimentController get instance => Get.find();

  final _experimentRepo = Get.put(ExperimentRepository());
  final _authRepo = Get.put(AuthenticationRepository());

  // Observable states
  final experiments = <ExperimentModel>[].obs;
  final isAddingExperiment = false.obs;
  final isLoading = false.obs;

  // Getter for current user ID
  String get userId => _authRepo.authUser?.uid ?? '';

  @override
  void onInit() {
    super.onInit();
    fetchExperiments();
  }

  // Fetch experiments
  Future<void> fetchExperiments() async {
    try {
      if (experiments.isEmpty) {
        isLoading.value = true;
      }
      final experimentsList = await _experimentRepo.getAllUserExperiments();
      experiments.assignAll(experimentsList);
    } catch (e) {
      JBLoaders.errorSnackBar(title: 'Oops..', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Add experiment
  Future<void> addExperiment(ExperimentModel experiment) async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      isAddingExperiment.value = true;
      await _experimentRepo.addExperiment(experiment);

      // Add the new experiment to the local list immediately
      experiments.add(experiment);

      // Fetch in background to ensure sync
      await fetchExperiments();
    } catch (e) {
      JBLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isAddingExperiment.value = false;
    }
  }

  // Update experiment
  Future<void> updateExperiment(ExperimentModel experiment) async {
    try {
      await _experimentRepo.updateExperiment(experiment);
      await fetchExperiments();
    } catch (e) {
      JBLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  // Delete experiment
  Future<void> deleteExperiment(String experimentId) async {
    try {
      await _experimentRepo.deleteExperiment(experimentId);
      await fetchExperiments();
    } catch (e) {
      JBLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  // Toggle experiment status
  Future<void> toggleExperimentStatus(
      String experimentId, String status) async {
    try {
      await _experimentRepo.toggleExperimentStatus(experimentId, status);
      await fetchExperiments();
    } catch (e) {
      JBLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  // Search experiments
  List<ExperimentModel> searchExperiments(String keyword) {
    return experiments
        .where((exp) => exp.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  // Getters for experiment statistics
  int get totalExperiments => experiments.length;
  int get ongoingExperiments =>
      experiments.where((exp) => exp.status == 'Ongoing').length;
  int get completedExperiments =>
      experiments.where((exp) => exp.status == 'Complete').length;

  List<ExperimentModel> get recentActivities {
    final sortedExperiments = experiments
        .where((exp) => exp.timeline != null)
        .toList()
      ..sort((a, b) => b.timeline!.compareTo(a.timeline!));
    return sortedExperiments.take(5).toList();
  }
}

class AddExperimentController extends GetxController {
  final experimentRepo = ExperimentRepository.instance;
  final authRepo = AuthenticationRepository.instance;

  static const String statusPlanned = 'Planned';
  static const String statusOngoing = 'Ongoing';
  static const String statusCompleted = 'Completed';

  final titleController = TextEditingController();
  final objectiveController = TextEditingController();
  final toolsController = TextEditingController();
  final stepsController = TextEditingController();

  final selectedDate = Rx<DateTime?>(null);
  final status = 'Planned'.obs;

  void setDate(DateTime? date) {
    selectedDate.value = date;
  }

  void setStatus(String newStatus) {
    status.value = newStatus;
  }

  // Clear all form fields
  void clearForm() {
    titleController.clear();
    objectiveController.clear();
    toolsController.clear();
    stepsController.clear();
    selectedDate.value = null;
    status.value = statusPlanned;
  }

  Future<void> submitData() async {
    if (titleController.text.isEmpty || objectiveController.text.isEmpty) {
      return;
    }

    final tools = toolsController.text.split(',').map((e) => e.trim()).toList();
    final steps = stepsController.text.split(',').map((e) => e.trim()).toList();
    final user = authRepo.authUser;

    if (user != null) {
      final experiment = ExperimentModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: titleController.text,
        objective: objectiveController.text,
        tools: tools,
        steps: steps,
        timeline: selectedDate.value,
        status: status.value,
        userId: user.uid,
      );

      final experimentController = Get.find<ExperimentController>();
      await experimentController.addExperiment(experiment);

      clearForm();

      Get.back();
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    objectiveController.dispose();
    toolsController.dispose();
    stepsController.dispose();
    super.onClose();
  }
}
