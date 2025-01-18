import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/features/personalization/controllers/gen_set_controller.dart';
import 'package:lab_tracker_app/features/personalization/screens/widgets/general_setting_card.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/sizes.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class GeneralSettingsPage extends StatelessWidget {
  final GeneralSettingsController _settingsController =
      Get.put(GeneralSettingsController());

  GeneralSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          S.of(context).general_settings,
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
        padding: const EdgeInsets.all(JBSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralSettingCard(
              context: context,
              title: S.of(context).language,
              icon: Icons.language,
              content: Obx(() => DropdownButton<String>(
                    value: _settingsController.selectedLanguage.value,
                    isExpanded: true,
                    dropdownColor: backgroundColor,
                    items: [
                      DropdownMenuItem(
                        value: 'English',
                        child: Text(S.of(context).english),
                      ),
                      DropdownMenuItem(
                        value: 'Arabic',
                        child: Text(S.of(context).arabic),
                      ),
                      DropdownMenuItem(
                        value: 'French',
                        child: Text(S.of(context).french),
                      ),
                    ],
                    onChanged: (newValue) {
                      if (newValue != null) {
                        _settingsController.updateLanguage(newValue);
                        // Update app locale dynamically
                        Get.updateLocale(_settingsController.locale);
                      }
                    },
                  )),
            ),
            const SizedBox(height: 16),
            GeneralSettingCard(
              context: context,
              title: S.of(context).notifications,
              icon: Icons.notifications,
              content: Obx(() => Switch(
                    value: _settingsController.notificationsEnabled.value,
                    onChanged: _settingsController.toggleNotifications,
                    activeColor: secondaryColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
