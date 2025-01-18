import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/styles.dart';
import '../../controllers/register/email_verification_controller.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(JBSizes.defaultSpace),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Mail sent image
                const Image(
                    image: AssetImage("assets/illustrations/message_sent.png"),
                    height: 300,
                    width: 300),
                const SizedBox(height: JBSizes.spaceBtwSections),

                // Text Message
                Center(
                  child: Text(
                    email ?? '',
                    style: JBStyles.h4Light,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: JBSizes.spaceBtwItems),

                // Text Message
                Center(
                  child: Text(
                    S.of(context).verify_email,
                    style: JBStyles.h2Light,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: JBSizes.spaceBtwSections),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.checkEmailVerification();
                      },
                      style: JBStyles.primaryButtonStyle(context),
                      child: Text(S.of(context).continu)),
                ),
                const SizedBox(height: JBSizes.spaceBtwItems),

                // Re-send Email Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.sendEmailVerification();
                      },
                      style: JBStyles.secondaryButtonStyle(context),
                      child: Text(S.of(context).resend)),
                )
              ],
            ),
          ),
        ));
  }
}
