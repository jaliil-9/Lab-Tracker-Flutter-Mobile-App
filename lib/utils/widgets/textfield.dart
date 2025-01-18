import 'package:flutter/material.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: accentColor),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
          fillColor: Colors.grey[100],
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}
