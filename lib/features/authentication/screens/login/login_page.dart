import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/features/authentication/controllers/login/login_controller.dart';
import 'package:lab_tracker_app/features/authentication/screens/login/forgot_password.dart';
import 'package:lab_tracker_app/features/authentication/screens/register/register_page.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import 'package:lab_tracker_app/utils/constants/sizes.dart';
import 'package:lab_tracker_app/utils/constants/styles.dart';
import '../../auth widgets/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(JBSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images/lab_tracker_no_bg.png',
              height: 200,
              width: 200,
            ),

            // Welcoming message
            Text(
              S.of(context).welcome_back_message,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: JBSizes.spaceBtwItems),
            Text(
              S.of(context).follow_up_welcome,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: JBSizes.spaceBtwSections),

            // Email textfield
            TextFormField(
              controller: controller.email,
              decoration: JBStyles.inputDecoration(
                context,
                hintText: S.of(context).email,
              ),
            ),

            const SizedBox(height: JBSizes.spaceBtwInputFields),

            // Password textfield
            Obx(
              () => TextFormField(
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  decoration: JBStyles.inputDecoration(
                    context,
                    hintText: S.of(context).password,
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye)),
                  )),
            ),

            // Remember me & Forgot Password
            Row(
              children: [
                Row(
                  children: [
                    Transform.translate(
                      offset: const Offset(-12, 0),
                      child: Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          activeColor: primaryColor,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value,
                        ),
                      ),
                    ),
                    Transform.translate(
                        offset: const Offset(-16, 0),
                        child: Text(S.of(context).remember_me))
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.to(() => const ForgetPasswordScreen()),
                  child: Text(
                    S.of(context).forgot_password,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: JBSizes.spaceBtwItems,
            ),

            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.signIn();
                },
                style: JBStyles.primaryButtonStyle(context),
                child: Text(S.of(context).login),
              ),
            ),

            const SizedBox(
              height: JBSizes.spaceBtwItems,
            ),

            // Register option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).not_a_member,
                    style: const TextStyle(color: primaryColor)),
                GestureDetector(
                  onTap: () => Get.to(() => const RegisterPage()),
                  child: Text(S.of(context).register_now,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: primaryColor)),
                )
              ],
            ),

            // Divider
            const SizedBox(height: JBSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(width: JBSizes.spaceBtwItems),
                  Text(
                    S.of(context).or,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: JBSizes.spaceBtwItems),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            ),

            // Google Sign in
            const SizedBox(height: JBSizes.spaceBtwSections),
            GoogleSignInCard(onTap: () => controller.googleSignIn()),
          ],
        ),
      ),
    );
  }
}
