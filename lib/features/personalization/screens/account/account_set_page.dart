import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/features/personalization/controllers/user_controller.dart';
import 'package:lab_tracker_app/features/personalization/screens/widgets/setting_card.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/features/personalization/screens/account/update_email_page.dart';
import 'package:lab_tracker_app/features/personalization/screens/account/update_password_page.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import 'package:lab_tracker_app/utils/constants/sizes.dart';
import 'package:lab_tracker_app/utils/constants/styles.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          S.of(context).account_settings,
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
            // Option for updating email
            SettingCard(
                context: context,
                title: S.of(context).update_email,
                icon: Icons.email,
                onTap: () => Get.to(() => const UpdateEmailPage())),
            const SizedBox(height: JBSizes.spaceBtwItems),

            // Option for changing password
            SettingCard(
                context: context,
                title: S.of(context).change_password,
                icon: Icons.lock,
                onTap: () => Get.to(() => const ChangePasswordPage())),
            const SizedBox(height: JBSizes.spaceBtwItems),

            // Option for deleting account
            SettingCard(
                context: context,
                title: S.of(context).delete_account,
                icon: Icons.lock,
                onTap: () => Get.to(() => const DeleteAccountPage())),
            const SizedBox(height: JBSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          S.of(context).delete_account,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(JBSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Warning Icon
            const Icon(
              Icons.warning_rounded,
              size: 60,
              color: Colors.red,
            ),
            const SizedBox(height: JBSizes.spaceBtwItems),

            // Warning Message
            Text(
              S.of(context).irreversible,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: JBSizes.spaceBtwItems),

            // Additional Explanation
            Text(
              S.of(context).deletion_explanation,
              style: const TextStyle(
                fontSize: 14,
                color: primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: JBSizes.spaceBtwSections),

            // Delete Account Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => userController.deleteUserAccount(),
                style: JBStyles.primaryButtonStyle(context),
                child: Text(S.of(context).delete_account,
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: JBSizes.spaceBtwItems),

            // Cancel Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => userController.deleteUserAccount(),
                style: JBStyles.secondaryButtonStyle(context),
                child: Text(S.of(context).cancel,
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
