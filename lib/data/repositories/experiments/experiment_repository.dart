import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/utils/helpers/loaders.dart';
import '../authentication/authentication_repository.dart';
import '../../../features/data management/models/experiment_model.dart';

class ExperimentRepository extends GetxController {
  static ExperimentRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _auth = AuthenticationRepository.instance;

  // Fetch experiments for current user
  Future<List<ExperimentModel>> getAllUserExperiments() async {
    final user = _auth.authUser;
    if (user != null) {
      final snapshot = await _db
          .collection('experiments')
          .where('userId', isEqualTo: user.uid)
          .get();
      return snapshot.docs
          .map((doc) => ExperimentModel.fromSnapshot(doc))
          .toList();
    }
    return [];
  }

  // Add new experiment
  Future<void> addExperiment(ExperimentModel experiment) async {
    try {
      await _db.collection('experiments').add(experiment.toJson());
    } catch (e) {
      JBLoaders.errorSnackBar(
          title: 'Oops..',
          message:
              'Something went wrong while adding experiment, please try again.');
    }
  }

  // Update experiment
  Future<void> updateExperiment(ExperimentModel experiment) async {
    try {
      await _db
          .collection('experiments')
          .doc(experiment.id)
          .update(experiment.toJson());
    } catch (e) {
      JBLoaders.errorSnackBar(
          title: 'Oops..',
          message: 'Something went wrong while updating experiment');
    }
  }

  // Delete experiment
  Future<void> deleteExperiment(String experimentId) async {
    try {
      await _db.collection('experiments').doc(experimentId).delete();
    } catch (e) {
      JBLoaders.errorSnackBar(
          title: 'Oops..',
          message: 'Something went wrong while deleting experiment');
    }
  }

  // Toggle experiment status
  Future<void> toggleExperimentStatus(
      String experimentId, String status) async {
    try {
      await _db
          .collection('experiments')
          .doc(experimentId)
          .update({'status': status});
    } catch (e) {
      JBLoaders.errorSnackBar(
          title: 'Oops..',
          message: 'Something went wrong while toggling experiment status');
    }
  }
}
