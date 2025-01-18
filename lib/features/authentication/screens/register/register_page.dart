import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import 'package:lab_tracker_app/utils/constants/sizes.dart';
import '../../../../utils/constants/styles.dart';
import '../../auth widgets/google_sign_in.dart';
import '../../controllers/register/register_controller.dart';
import '../login/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(JBSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcoming message
            Text(
              S.of(context).first_welcome,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: JBSizes.spaceBtwItems),
            Text(
              S.of(context).follow_up_first_welcome,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),

            // Fullname textfield
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstname,
                    decoration: JBStyles.inputDecoration(
                      context,
                      hintText: S.of(context).first_name,
                    ),
                  ),
                ),
                const SizedBox(
                  width: JBSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastname,
                    decoration: JBStyles.inputDecoration(
                      context,
                      hintText: S.of(context).last_name,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: JBSizes.spaceBtwInputFields),

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

            const SizedBox(
              height: JBSizes.spaceBtwItems,
            ),

            // Register button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.signup();
                },
                style: JBStyles.primaryButtonStyle(context),
                child: Text(S.of(context).sign_up),
              ),
            ),

            const SizedBox(
              height: JBSizes.spaceBtwItems,
            ),

            // Login option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).a_member,
                    style: const TextStyle(color: secondaryColor)),
                GestureDetector(
                  onTap: () => Get.to(() => const LoginPage()),
                  child: Text(S.of(context).login_now,
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
