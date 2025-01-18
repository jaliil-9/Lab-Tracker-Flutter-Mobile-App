import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/common/bindings.dart';
import 'package:lab_tracker_app/features/personalization/controllers/gen_set_controller.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/main.dart';
import 'package:lab_tracker_app/splash_screen.dart';

class MyApp extends StatelessWidget {
  final GeneralSettingsController settingsController;

  const MyApp({super.key, required this.settingsController});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        // Localization delegates for app translation support
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: settingsController
          .locale, // Set initial locale from SettingsController
      navigatorKey: navigatorKey, // Global navigator key for navigation
      initialBinding: GeneralBindings(),
      home: const SplashScreen(),
    );
  }
}
