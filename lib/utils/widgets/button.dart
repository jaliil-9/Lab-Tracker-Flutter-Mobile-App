import 'package:flutter/material.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: textSecondaryColor),
          ),
        ),
      ),
    );
  }
}
