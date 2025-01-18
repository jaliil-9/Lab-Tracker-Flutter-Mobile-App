import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/styles.dart';
import '../../../../utils/helpers/validation.dart';
import '../../controllers/login/forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
        backgroundColor: backgroundColor,

        // AppBar
        appBar: AppBar(
          backgroundColor: backgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(JBSizes.defaultSpace),
          child: Center(
            child: Column(
              children: [
                // Reset Password Message
                Center(
                  child: Text(S.of(context).reset_password,
                      style: JBStyles.h1Light, textAlign: TextAlign.center),
                ),

                const SizedBox(height: JBSizes.spaceBtwItems),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: JBSizes.fontSizeMd),
                    child: Text(S.of(context).dont_worry,
                        style: JBStyles.h4Light, textAlign: TextAlign.center),
                  ),
                ),
                const SizedBox(height: JBSizes.spaceBtwSections),

                // Email
                Form(
                  key: controller.forgetPasswordFormKey,
                  child: TextFormField(
                      controller: controller.email,
                      validator: JBValidator.validateEmail,
                      decoration: JBStyles.inputDecoration(
                        context,
                        labelText: S.of(context).email,
                      )),
                ),

                const SizedBox(height: JBSizes.spaceBtwSections),

                // Reset Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.sendPasswordResetEmail();
                      },
                      style: JBStyles.primaryButtonStyle(context),
                      child: Text(S.of(context).send_reset_link)),
                )
              ],
            ),
          ),
        ));
  }
}
