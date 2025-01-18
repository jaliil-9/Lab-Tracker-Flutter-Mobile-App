import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/helpers/loaders.dart';
import '../../screens/register/success_verification.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send Email when verify email screen appears
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      JBLoaders.successSnackBar(
          title: "Alright!",
          message: "Verification email link sent, check your inbox.");
    } catch (e) {
      JBLoaders.errorSnackBar(title: "Oops..", message: e.toString());
    }
  }

  // Timer to automatically redirect on email verification
  setTimerForAutoRedirect() async {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.to(() => const EmailVerifiedScreen());
      }
    });
  }

  // Manually check if email is verified
  checkEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user?.emailVerified != null && user!.emailVerified) {
      AuthenticationRepository.instance.screenRedirect();
    }
  }
}
