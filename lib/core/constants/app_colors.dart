import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // New theme colors based on the screenshot
  static const Color background = Color(0xFF14161C); // Dark blueish-grey background
  static const Color surface = Color(0xFF1D2029);    // Lighter color for cards and surfaces
  static const Color primary = Color(0xFF4D7ADF);    // Vibrant blue for accents and selected items
  static const Color primaryDark = Color(0xFF1B3A87); // Kept from original, might be useful
  static const Color primaryRed = Color(0xFFC93A3A);

  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFA0A0A0);
  
  static const Color ratingStar = Color(0xFFFFC107);
  static const Color transparent = Colors.transparent;
  
  // Badge colors can remain as they are
  static const Color badgeGreen = Color(0xFF00D289);
  static const Color badgeDark = Color(0xFF1C2028);
  static const Color badgeBlue = Color(0xFF386EEB);
}
