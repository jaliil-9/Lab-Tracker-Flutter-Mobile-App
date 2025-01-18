import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralSettingsController extends GetxController {
  var selectedLanguage = 'English'.obs;
  var notificationsEnabled = true.obs;
  var pin = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadLanguage();
  }

  // Load the language from SharedPreferences
  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedLanguage = prefs.getString('language');
    if (savedLanguage != null) {
      selectedLanguage.value = savedLanguage;
    }
  }

  // Save the language to SharedPreferences
  Future<void> saveLanguage(String newLanguage) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', newLanguage);
  }

  void updateLanguage(String newLanguage) async {
    selectedLanguage.value = newLanguage;
    await saveLanguage(newLanguage); // Persist the language change
  }

  Locale get locale {
    switch (selectedLanguage.value) {
      case 'Arabic':
        return const Locale('ar');
      case 'French':
        return const Locale('fr');
      default:
        return const Locale('en');
    }
  }

  void toggleNotifications(bool isEnabled) {
    notificationsEnabled.value = isEnabled;
  }

  void setPin(String newPin) {
    pin.value = newPin;
  }
}
