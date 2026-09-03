import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textThemeData(ColorScheme colorScheme) {
  return GoogleFonts.dmSansTextTheme(
    TextTheme(
      // Display
      displayLarge: TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.w700,
        height: 1.1,
        color: colorScheme.onSurface,
      ),
      displayMedium: TextStyle(
        fontSize: 52,
        fontWeight: FontWeight.w700,
        height: 1.1,
        color: colorScheme.onSurface,
      ),
      displaySmall: TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.w600,
        height: 1.15,
        color: colorScheme.onSurface,
      ),

      // Headlines
      headlineLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: colorScheme.onSurface,
      ),
      headlineMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: colorScheme.onSurface,
      ),
      headlineSmall: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: colorScheme.onSurface,
      ),

      // Titles
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: colorScheme.onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1.3,
        color: colorScheme.onSurface,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.3,
        color: colorScheme.onSurface,
      ),

      // Body
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: colorScheme.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: colorScheme.onSurface,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.45,
        color: colorScheme.onSurfaceVariant,
      ),

      // Labels
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: colorScheme.onSurface,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.25,
        color: colorScheme.onSurface,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.25,
        color: colorScheme.onSurfaceVariant,
      ),
    ),
  );
}
