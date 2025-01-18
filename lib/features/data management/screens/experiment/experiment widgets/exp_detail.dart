import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import '../../../../../utils/helpers/loaders.dart';
import '../../../controllers/experiment_controller.dart';
import '../../../models/experiment_model.dart';

class ExperimentDetailPage extends StatelessWidget {
  final ExperimentModel experiment;

  const ExperimentDetailPage(this.experiment, {super.key});

  @override
  Widget build(BuildContext context) {
    final ExperimentController experimentController = Get.find();
    final observationsController = TextEditingController(
      text: experiment.observations ?? '',
    );
    final resultsController = TextEditingController(
      text: experiment.results ?? '',
    );
    final notesController = TextEditingController(
      text: experiment.notes ?? '',
    );
    final status = experiment.status.obs;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          experiment.title,
          style: const TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextSection(
                context,
                '${S.of(context).form_objective}:',
                experiment.objective,
              ),
              _buildTextSection(
                context,
                '${S.of(context).form_tools}:',
                experiment.tools.join(', '),
              ),
              _buildTextSection(
                context,
                '${S.of(context).form_steps}:',
                experiment.steps.join('\n'),
              ),
              _buildTextSection(
                context,
                '${S.of(context).timeline}:',
                experiment.timeline?.toLocal().toString().split(' ')[0],
              ),
              _buildTextSection(
                context,
                '${S.of(context).exp_status}:',
                experiment.status,
                editWidget: Obx(
                  () => DropdownButton<String>(
                    value: status.value,
                    onChanged: (String? newValue) {
                      status.value = newValue!;
                    },
                    items: <String>['Planned', 'Ongoing', 'Complete']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(_getLocalizedStatus(context, value)),
                      );
                    }).toList(),
                  ),
                ),
              ),
              _buildTextSection(
                context,
                S.of(context).exp_observations,
                experiment.observations,
                editWidget: _buildTextInputField(
                  controller: observationsController,
                  maxLines: 3,
                ),
              ),
              _buildTextSection(
                context,
                S.of(context).exp_results,
                experiment.results,
                editWidget: _buildTextInputField(
                  controller: resultsController,
                  maxLines: 3,
                ),
              ),
              _buildTextSection(
                context,
                S.of(context).exp_notes,
                experiment.notes,
                editWidget: _buildTextInputField(
                  controller: notesController,
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final updatedExperiment = ExperimentModel(
            id: experiment.id,
            title: experiment.title,
            objective: experiment.objective,
            tools: experiment.tools,
            steps: experiment.steps,
            timeline: experiment.timeline,
            status: status.value,
            observations: observationsController.text,
            results: resultsController.text,
            notes: notesController.text,
            userId: experiment.userId,
          );

          experimentController.updateExperiment(updatedExperiment);
          Get.back(); // Navigate back after updating
          JBLoaders.successSnackBar(
            title: 'Success',
            message: S.of(context).exp_updated_successfully,
          );
        },
        backgroundColor: secondaryColor,
        tooltip: 'Save Updates',
        child: const Icon(Icons.save, color: textSecondaryColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildTextSection(BuildContext context, String title, String? content,
      {Widget? editWidget}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        editWidget ?? Text(content ?? S.of(context).no_info_provided),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTextInputField({
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
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
      maxLines: maxLines,
    );
  }

  String _getLocalizedStatus(BuildContext context, String status) {
    switch (status) {
      case 'Planned':
        return S.of(context).planned_exp;
      case 'Ongoing':
        return S.of(context).ongoing_exp;
      case 'Complete':
        return S.of(context).completed_exp;
      default:
        return S.of(context).unknown_exp;
    }
  }
}
