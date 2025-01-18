import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/features/data%20management/screens/experiment/experiment%20widgets/add_exp_form.dart';
import 'package:lab_tracker_app/features/data%20management/screens/experiment/experiment%20widgets/add_exp_option.dart';
import 'package:lab_tracker_app/features/data%20management/screens/experiment/experiment%20widgets/experiment_item.dart';
import 'package:lab_tracker_app/features/data%20management/screens/experiment/experiment%20widgets/quick_exp_field.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import 'package:lab_tracker_app/utils/constants/sizes.dart';
import 'package:lab_tracker_app/utils/widgets/search_bar.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import '../../controllers/experiment_controller.dart';

class ExperimentsPage extends StatelessWidget {
  ExperimentsPage({super.key});

  final ExperimentController experimentController =
      Get.put(ExperimentController());
  final _quickExperimentController = TextEditingController();
  final showQuickExperimentField = false.obs;
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
              S.of(context).experiments_title,
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
          showQuickExperimentField.value = false;
        },
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(JBSizes.defaultSpace),
                child: Column(
                  children: [
                    MySearchBar(
                      onChanged: (value) =>
                          experimentController.searchExperiments(value),
                    ),
                    const SizedBox(height: JBSizes.spaceBtwSections),
                    Expanded(
                      child: Obx(
                        () {
                          if (experimentController.isLoading.value) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (experimentController.experiments.isEmpty) {
                            return Center(
                              child: Text(
                                S.of(context).add_new_exp,
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
                                itemCount:
                                    experimentController.experiments.length,
                                itemBuilder: (context, index) => ExperimentItem(
                                  experiment:
                                      experimentController.experiments[index],
                                  onDelete:
                                      experimentController.deleteExperiment,
                                  onToggleStatus: experimentController
                                      .toggleExperimentStatus,
                                ),
                              ),

                              // Loading indicator that appears on top
                              if (experimentController.isAddingExperiment.value)
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
                                          S.of(context).adding_experiment,
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

            // Quick experiment field
            Obx(() {
              if (showQuickExperimentField.value) {
                return Positioned(
                  bottom: 120,
                  right: 16,
                  left: 16,
                  child: QuickExpField(
                      quickExperimentController: _quickExperimentController,
                      experimentController: experimentController,
                      showQuickExperimentField: showQuickExperimentField,
                      context: context),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),

      // Add experiment expandable button
      floatingActionButton: Obx(() => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (isFabExpanded.value) ...[
                // Add quick experiment button
                AddExpOption(
                    icon: Icons.task_alt,
                    label: S.of(context).quick_experiment,
                    onPressed: () {
                      showQuickExperimentField.value = true;
                      isFabExpanded.value = false;
                    }),
                const SizedBox(height: JBSizes.spaceBtwItems),

                // Add detailed experiment button
                AddExpOption(
                    icon: Icons.add,
                    label: S.of(context).detailed_experiment,
                    onPressed: () {
                      _showAddExperimentForm();
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

  void _showAddExperimentForm() {
    Get.bottomSheet(
      Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
        child: AddExperimentForm(),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }
}
