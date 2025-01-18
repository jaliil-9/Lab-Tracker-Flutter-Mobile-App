import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lab_tracker_app/data/repositories/authentication/authentication_repository.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import 'package:lab_tracker_app/utils/constants/sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Wait for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    // Remove the native splash screen
    FlutterNativeSplash.remove();

    // Trigger the authentication redirect
    await AuthenticationRepository.instance.screenRedirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/lab_tracker_no_bg.png',
              height: 300,
              width: 300,
            ),
            const SizedBox(height: JBSizes.spaceBtwItems),
            const CircularProgressIndicator(color: accentColor),
          ],
        ),
      ),
    );
  }
}
