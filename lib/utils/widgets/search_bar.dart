import 'package:flutter/material.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import '../constants/colors.dart';

class MySearchBar extends StatelessWidget {
  final Function(String) onChanged;

  const MySearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: S.of(context).searchbar_hint,
            prefixIcon: const Icon(Icons.search, color: primaryColor),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: accentColor),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: secondaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
