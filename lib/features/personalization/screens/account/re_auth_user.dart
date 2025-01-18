import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/styles.dart';
import '../../../../utils/helpers/validation.dart';
import '../../controllers/user_controller.dart';

class ReAuthUser extends StatelessWidget {
  const ReAuthUser({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text(
            "Re-Authenticate",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(JBSizes.defaultSpace),
          child:

              // Login Form
              Form(
            key: controller.reAuthFormKey,
            child: Column(children: [
              // Email
              TextFormField(
                  controller: controller.verufyEmail,
                  validator: (value) => JBValidator.validateEmail(value),
                  decoration: JBStyles.inputDecoration(
                    context,
                    labelText: S.of(context).email,
                  )),
              const SizedBox(height: JBSizes.spaceBtwInputFields),

              // Password
              Obx(
                () => TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value) {
                      JBValidator.validateEmptyText(
                          S.of(context).password, value);
                      return null;
                    },
                    obscureText: controller.hidePassword.value,
                    decoration: JBStyles.inputDecoration(
                      context,
                      labelText: S.of(context).password,
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye)),
                    )),
              ),
              const SizedBox(height: JBSizes.spaceBtwItems / 6),

              const SizedBox(height: JBSizes.spaceBtwItems),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () =>
                        controller.reAuthenticateEmailPasswordUser(),
                    style: JBStyles.primaryButtonStyle(context),
                    child: Text(S.of(context).continu)),
              )
            ]),
          ),
        )));
  }
}
