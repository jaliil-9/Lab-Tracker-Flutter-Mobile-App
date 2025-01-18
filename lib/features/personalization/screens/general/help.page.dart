import 'package:flutter/material.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          S.of(context).help,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHelpTile(
              context: context,
              title: S.of(context).getting_started,
              description: S.of(context).learn_how,
              icon: Icons.play_arrow,
              onTap: () {
                // Navigate to a detailed "Getting Started" guide.
              },
            ),
            const SizedBox(height: 16),
            _buildHelpTile(
              context: context,
              title: S.of(context).faqs,
              description: S.of(context).find_answers,
              icon: Icons.help,
              onTap: () {
                // Navigate to FAQs page.
              },
            ),
            const SizedBox(height: 16),
            _buildHelpTile(
              context: context,
              title: S.of(context).contact_support,
              description: S.of(context).get_in_touch,
              icon: Icons.support_agent,
              onTap: () {
                // Navigate to contact support page or open email client.
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpTile({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Icon(icon, color: primaryColor),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
          subtitle: Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          trailing: const Icon(Icons.arrow_forward, color: primaryColor),
        ),
      ),
    );
  }
}
