import 'package:flutter/material.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';

class JBStyles {
  // Status Colors
  static const Color successLight = Color(0xFF2E7D32);
  static const Color successDark = Color(0xFF81C784);
  static const Color errorLight = Color(0xFFC62828);
  static const Color errorDark = Color(0xFFFF8A80);
  static const Color infoLight = secondaryColor;
  static const Color infoDark = Color(0xFF90CAF9);

  // Typography Styles - Light Mode
  static TextStyle h1Light = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h2Light = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.normal,
  );

  static TextStyle h3Light = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h4Light = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h5Light = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static TextStyle h6Light = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );

  // Button Styles
  static ButtonStyle primaryButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static ButtonStyle secondaryButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: secondaryColor,
      foregroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  // Input Decoration
  static InputDecoration inputDecoration(BuildContext context,
      {String? labelText, String? hintText, Widget? suffixIcon}) {
    return InputDecoration(
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: accentColor),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Colors.grey[100],
        filled: true,
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]));
  }
}
