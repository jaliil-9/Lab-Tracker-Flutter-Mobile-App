import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/sizes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../controllers/experiment_controller.dart';

class AddExperimentForm extends StatelessWidget {
  AddExperimentForm({super.key});

  final controller = Get.put(AddExperimentController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(JBSizes.defaultSpace),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          TextField(
            controller: controller.titleController,
            decoration: InputDecoration(
              labelText: S.of(context).form_title,
              labelStyle: const TextStyle(color: secondaryColor),
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
          ),
          const SizedBox(height: JBSizes.spaceBtwInputFields),

          // Objective
          TextField(
            controller: controller.objectiveController,
            decoration: InputDecoration(
              labelText: S.of(context).form_objective,
              labelStyle: const TextStyle(color: secondaryColor),
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
          ),
          const SizedBox(height: JBSizes.spaceBtwInputFields),

          // Tools
          TextField(
            controller: controller.toolsController,
            decoration: InputDecoration(
              labelText: S.of(context).form_tools,
              labelStyle: const TextStyle(color: secondaryColor),
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
          ),
          const SizedBox(height: JBSizes.spaceBtwInputFields),

          // Steps
          TextField(
            controller: controller.stepsController,
            decoration: InputDecoration(
              labelText: S.of(context).form_steps,
              labelStyle: const TextStyle(color: secondaryColor),
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
          ),
          const SizedBox(height: JBSizes.spaceBtwInputFields),

          // Date
          Row(
            children: [
              Text(S.of(context).timeline),
              const SizedBox(width: JBSizes.spaceBtwItems),
              Expanded(
                child: Obx(() => Text(
                      controller.selectedDate.value == null
                          ? S.of(context).form_no_date_chosen
                          : controller.selectedDate.value!
                              .toLocal()
                              .toString()
                              .split(' ')[0],
                    )),
              ),

              // Select date button
              ElevatedButton(
                onPressed: () => _presentDatePicker(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  S.of(context).form_choose_date,
                  style: const TextStyle(color: textSecondaryColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: JBSizes.spaceBtwItems),
          Obx(() => DropdownButtonFormField<String>(
                value: controller.status.value,
                onChanged: (String? newValue) {
                  if (newValue != null) controller.setStatus(newValue);
                },
                items: [
                  DropdownMenuItem(
                    value: AddExperimentController.statusPlanned,
                    child: Text(S.of(context).planned_exp),
                  ),
                  DropdownMenuItem(
                    value: AddExperimentController.statusOngoing,
                    child: Text(S.of(context).ongoing_exp),
                  ),
                  DropdownMenuItem(
                    value: AddExperimentController.statusCompleted,
                    child: Text(S.of(context).completed_exp),
                  ),
                ],
                decoration: InputDecoration(
                  labelText: S.of(context).exp_status,
                  labelStyle: const TextStyle(color: secondaryColor),
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
              )),
          const SizedBox(height: JBSizes.spaceBtwSections),

          // Submit data button
          ElevatedButton(
            onPressed: controller.submitData,
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor,
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
            ),
            child: Text(
              S.of(context).form_add_exp,
              style: const TextStyle(color: textSecondaryColor),
            ),
          ),
        ],
      ),
    );
  }

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (ctx, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: secondaryColor,
            colorScheme: const ColorScheme.light(primary: secondaryColor),
          ),
          child: child!,
        );
      },
    ).then((pickedDate) {
      if (pickedDate != null) {
        controller.setDate(pickedDate);
      }
    });
  }
}
