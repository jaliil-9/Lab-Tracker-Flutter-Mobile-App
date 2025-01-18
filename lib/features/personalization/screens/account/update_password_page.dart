import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import 'package:lab_tracker_app/utils/constants/sizes.dart';
import 'package:lab_tracker_app/utils/constants/styles.dart';
import '../../../../generated/l10n.dart';
import '../../controllers/user_controller.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController currentPasswordController =
        TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    final UserController userController = Get.put(UserController());

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          S.of(context).change_password,
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
            TextFormField(
              decoration: JBStyles.inputDecoration(
                context,
                hintText: S.of(context).current_password,
              ),
              controller: currentPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: JBSizes.spaceBtwInputFields),
            TextFormField(
              decoration: JBStyles.inputDecoration(
                context,
                hintText: S.of(context).new_password,
              ),
              controller: newPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: JBSizes.spaceBtwInputFields),
            TextFormField(
              decoration: JBStyles.inputDecoration(
                context,
                hintText: S.of(context).confirm_new_password,
              ),
              controller: confirmPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: JBSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final currentPassword = currentPasswordController.text;
                  final newPassword = newPasswordController.text;
                  final confirmPassword = confirmPasswordController.text;

                  if (newPassword == confirmPassword) {
                    userController.changePassword(currentPassword, newPassword);
                  } else {
                    Get.snackbar(
                      "Error",
                      "Passwords do not match.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                style: JBStyles.secondaryButtonStyle(context),
                child: Center(
                  child: Text(
                    S.of(context).change_password,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
