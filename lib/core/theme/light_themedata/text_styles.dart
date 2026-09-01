import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textThemeData = GoogleFonts.dmSansTextTheme(
  const TextTheme(
    // Large display text
    displayLarge: TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w700,
      height: 1.1,
    ),
    displayMedium: TextStyle(
      fontSize: 52,
      fontWeight: FontWeight.w700,
      height: 1.1,
    ),
    displaySmall: TextStyle(
      fontSize: 44,
      fontWeight: FontWeight.w600,
      height: 1.15,
    ),

    // Page / section headings
    headlineLarge: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    headlineMedium: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
    headlineSmall: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      height: 1.25,
    ),

    // Titles
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.3,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.3,
    ),

    // Body
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.45,
    ),

    // Buttons, chips, labels
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.25,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.25,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.25,
    ),
  ),
);
