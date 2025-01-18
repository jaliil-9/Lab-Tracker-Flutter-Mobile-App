import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/home_page.dart';
import '../../../../../utils/helpers/network_manager.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/helpers/loaders.dart';
import '../../../personalization/controllers/user_controller.dart';
import '../../../personalization/models/user_model.dart';
import '../../screens/register/verify_email.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final phonenumber = TextEditingController();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  // Register
  void signup() async {
    try {
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Register user in Firebase Authentication
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save user data in Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstname: firstname.text.trim(),
        lastname: lastname.text.trim(),
        email: email.text.trim(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Show success message
      JBLoaders.successSnackBar(
          title: "Done!", message: "Your Account has been created successfuly");

      // Move to Veryfy Email Page
      Get.to(() => EmailVerificationScreen(email: email.text.trim()));
    } catch (e) {
      // Show error to user
      JBLoaders.errorSnackBar(title: 'Oops..', message: e.toString());
    }
  }

  // Google Sign In
  void googleSignIn() async {
    try {
      // Check Internet Connection & Update state
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Sign in with Google
      final userCredentials =
          await AuthenticationRepository.instance.loginWithGoogle();

      // Save user data in Firestore
      await userController.saveUserRecord(userCredentials);

      // Redirect to Home Page
      Get.to(() => const HomePage());
    } catch (e) {
      // Show error to user
      JBLoaders.errorSnackBar(title: 'Oops..', message: e.toString());
    }
  }
}
