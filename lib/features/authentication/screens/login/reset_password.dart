import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab_tracker_app/features/authentication/screens/login/login_page.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/styles.dart';

class PasswordResetSucc extends StatelessWidget {
  const PasswordResetSucc({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(JBSizes.defaultSpace),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Reset Link sent image
                const Image(
                    image: AssetImage("assets/illustrations/mail_sent.png"),
                    height: 300,
                    width: 300),
                const SizedBox(height: JBSizes.spaceBtwSections),

                // Check your inbox text
                Center(
                  child: Text(
                    email,
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: JBSizes.spaceBtwSections),

                // Check your inbox text
                Center(
                  child: Text(
                    S.of(context).reset_link_sent,
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
                        Get.to(() => const LoginPage());
                      },
                      style: JBStyles.primaryButtonStyle(context),
                      child: Text(S.of(context).continu)),
                )
              ],
            ),
          ),
        ));
  }
}
