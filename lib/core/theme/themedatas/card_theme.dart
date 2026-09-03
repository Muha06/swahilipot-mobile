import 'package:flutter/material.dart';
 import 'package:swahilipothub/core/constants/spacing/app_spacing.dart';
 
CardThemeData cardThemeData(ColorScheme colorScheme) {
  return CardThemeData(
    color: colorScheme.surface,
    shadowColor: colorScheme.shadow,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.md),
      side: BorderSide(color: colorScheme.outline),
    ),
  );
}
