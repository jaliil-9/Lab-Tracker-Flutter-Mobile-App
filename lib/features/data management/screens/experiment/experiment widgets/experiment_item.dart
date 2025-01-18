import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/features/data%20management/models/experiment_model.dart';
import 'package:lab_tracker_app/features/data%20management/screens/experiment/experiment%20widgets/exp_detail.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class ExperimentItem extends StatelessWidget {
  final ExperimentModel experiment;
  final Function(String) onDelete;
  final Function(String, String) onToggleStatus;

  const ExperimentItem({
    super.key,
    required this.experiment,
    required this.onDelete,
    required this.onToggleStatus,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ExperimentDetailPage(experiment));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
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
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experiment.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    experiment.objective,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 5),
                  _buildStatusWidget(context, experiment.status),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red, size: 30),
              onPressed: () {
                _showDeleteConfirmationDialog(context, experiment.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, String experimentId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).confirm_deletion),
          content: Text(S.of(context).are_you_sure_delete),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                S.of(context).delete,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                onDelete(experimentId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatusWidget(BuildContext context, String status) {
    Color bgColor;
    String text;
    switch (status) {
      case 'Planned':
        bgColor = Colors.blue;
        text = S.of(context).planned_exp;
        break;
      case 'Ongoing':
        bgColor = Colors.orange;
        text = S.of(context).ongoing_exp;
        break;
      case 'Complete':
        bgColor = Colors.green;
        text = S.of(context).completed_exp;
        break;
      default:
        bgColor = Colors.grey;
        text = S.of(context).unknown_exp;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
