import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lab_tracker_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab_tracker_app/data/repositories/authentication/authentication_repository.dart';
import 'package:lab_tracker_app/features/personalization/controllers/gen_set_controller.dart';
import 'firebase_options.dart';

// Global navigator key for accessing the context globally
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Initialize Local Storage
  await GetStorage.init();

  // Await Splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  // Initialize SettingsController and load the saved language
  final GeneralSettingsController settingsController =
      Get.put(GeneralSettingsController());
  await settingsController.loadLanguage();

  // Starts the app with the necessary settings service
  runApp(MyApp(settingsController: settingsController));
}
