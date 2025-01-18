import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lab_tracker_app/home_page.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../../utils/helpers/loaders.dart';
import '../../../../../utils/helpers/network_manager.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('remember_me_email') ?? '';
    password.text = localStorage.read('remember_me_password') ?? '';

    super.onInit();
  }

  void signIn() async {
    try {
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Save data if rememberMe is checked
      if (rememberMe.value) {
        localStorage.write('remember_me_email', email.text.trim());
        localStorage.write('remember_me_password', password.text.trim());
      } else {
        localStorage.remove('remember_me_email');
        localStorage.remove('remember_me_password');
      }

      // Login user
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Redirect to Home Page
      Get.to(() => const HomePage());
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
