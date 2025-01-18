import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import 'package:lab_tracker_app/utils/constants/sizes.dart';
import 'package:lab_tracker_app/utils/constants/styles.dart';

import '../../controllers/user_controller.dart';

class UpdateEmailPage extends StatelessWidget {
  const UpdateEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final UserController userController = Get.put(UserController());

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          S.of(context).update_email,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(JBSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: emailController,
                decoration: JBStyles.inputDecoration(
                  context,
                  hintText: S.of(context).new_email,
                ),
                obscureText: false,
              ),
              const SizedBox(height: JBSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final newEmail = emailController.text.trim();
                    if (newEmail.isNotEmpty) {
                      userController.updateEmail(newEmail);
                    } else {
                      Get.snackbar(
                        "Error",
                        "Please enter a valid email.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  style: JBStyles.secondaryButtonStyle(context),
                  child: Center(
                    child: Text(
                      S.of(context).update_email,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
