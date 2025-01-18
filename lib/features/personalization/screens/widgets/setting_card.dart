import 'package:flutter/material.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    super.key,
    required this.context,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final BuildContext context;
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Action when tile is tapped
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Tile background color
          borderRadius: BorderRadius.circular(12), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05), // Light shadow
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Icon(icon, color: primaryColor), // Icon for the tile
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward,
              color: primaryColor), // Navigation indicator
        ),
      ),
    );
  }
}
