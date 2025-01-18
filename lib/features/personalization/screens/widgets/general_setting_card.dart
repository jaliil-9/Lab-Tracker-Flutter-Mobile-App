import 'package:flutter/material.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class GeneralSettingCard extends StatelessWidget {
  const GeneralSettingCard({
    super.key,
    required this.context,
    required this.title,
    required this.icon,
    required this.content,
  });

  final BuildContext context;
  final String title;
  final IconData icon;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Row(
            children: [
              Icon(icon, color: primaryColor),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
