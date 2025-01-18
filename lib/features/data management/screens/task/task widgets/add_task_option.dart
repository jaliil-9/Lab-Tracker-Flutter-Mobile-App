import 'package:flutter/material.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class AddTaskOption extends StatelessWidget {
  const AddTaskOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          heroTag: label,
          onPressed: onPressed,
          backgroundColor: secondaryColor,
          child: Icon(icon, color: Colors.white),
        ),
      ],
    );
  }
}
