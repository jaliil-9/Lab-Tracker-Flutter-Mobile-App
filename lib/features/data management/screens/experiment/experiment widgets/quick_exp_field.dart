import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/features/data%20management/controllers/experiment_controller.dart';
import 'package:lab_tracker_app/features/data%20management/models/experiment_model.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class QuickExpField extends StatelessWidget {
  const QuickExpField({
    super.key,
    required TextEditingController quickExperimentController,
    required this.experimentController,
    required this.showQuickExperimentField,
    required this.context,
  }) : _quickExperimentController = quickExperimentController;

  final TextEditingController _quickExperimentController;
  final ExperimentController experimentController;
  final RxBool showQuickExperimentField;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 120,
      right: 16,
      left: 16,
      child: GestureDetector(
        onTap: () {},
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding:
                const EdgeInsets.only(left: 16, bottom: 8, top: 8, right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _quickExperimentController,
                    decoration: InputDecoration(
                      hintText: S.of(context).enter_quick_exp,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: secondaryColor),
                  onPressed: () {
                    if (_quickExperimentController.text.isNotEmpty) {
                      final experiment = ExperimentModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        title: _quickExperimentController.text,
                        objective: '',
                        tools: [],
                        steps: [],
                        timeline: null,
                        status: 'Planned',
                        userId: experimentController.userId,
                      );
                      experimentController.addExperiment(experiment);
                      _quickExperimentController.clear();
                      showQuickExperimentField.value = false;
                    }
                  },
                ),
                IconButton(
                    onPressed: () {
                      _quickExperimentController
                          .clear(); // Clear the input field
                      showQuickExperimentField.value =
                          false; // Hide the input field
                    },
                    icon: const Icon(
                      Icons.cancel_rounded,
                      color: secondaryColor,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
