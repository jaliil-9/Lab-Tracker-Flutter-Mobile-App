import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/helpers/loaders.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../screens/login/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Password Reset Email
  sendPasswordResetEmail() async {
    try {
      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        return;
      }

      // Send Password Reset Email
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Show Success Message
      JBLoaders.successSnackBar(
          title: 'Emain Sent',
          message: 'Check your email for password reset instructions'.tr);

      // Redirect to Password reset screen
      Get.to(() => PasswordResetSucc(email: email.text.trim()));
    } catch (e) {
      JBLoaders.errorSnackBar(
          title: 'Oops..', message: 'Failed to resend password reset email'.tr);
    }
  }
}
