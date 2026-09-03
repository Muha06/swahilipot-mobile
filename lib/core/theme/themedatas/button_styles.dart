import 'package:flutter/material.dart';
 import 'package:swahilipothub/core/constants/radius/app_radius.dart';
import 'package:swahilipothub/core/constants/spacing/app_spacing.dart';
import 'package:swahilipothub/core/theme/themedatas/text_styles.dart';

ElevatedButtonThemeData elevatedBtnThemeData(ColorScheme colorScheme) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        // Disabled
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.primary.withValues(alpha: 0.4);
        }

        // Pressed
        if (states.contains(WidgetState.pressed)) {
          return colorScheme.primary.withValues(alpha: 0.55);
        }

        // Hovered
        if (states.contains(WidgetState.hovered)) {
          return colorScheme.primary.withValues(alpha: 0.92);
        }

        // Normal
        return colorScheme.primary;
      }),

      foregroundColor: WidgetStatePropertyAll(colorScheme.onPrimary),

      textStyle: WidgetStatePropertyAll(textThemeData(colorScheme).labelLarge),

      elevation: const WidgetStatePropertyAll(1),

      minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 52)),

      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),

      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      ),
    ),
  );
}

FilledButtonThemeData filledButtonThemeData(ColorScheme colorScheme) {
  return FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        // Disabled
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withValues(alpha: 0.4);
        }

        // Pressed
        if (states.contains(WidgetState.pressed)) {
          return colorScheme.onSurface.withValues(alpha: 0.65);
        }

        // Hovered
        if (states.contains(WidgetState.hovered)) {
          return colorScheme.onSurface.withValues(alpha: 0.92);
        }

        // Normal
        return colorScheme.onSurface;
      }),

      foregroundColor: WidgetStatePropertyAll(colorScheme.surface),

      textStyle: WidgetStatePropertyAll(textThemeData(colorScheme).labelLarge),

      elevation: const WidgetStatePropertyAll(0),

      minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 52)),

      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),

      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      ),
    ),
  );
}

OutlinedButtonThemeData outlinedButtonThemeData(ColorScheme colorScheme) {
  return OutlinedButtonThemeData(
    style: ButtonStyle(
      elevation: const WidgetStatePropertyAll(0),

      backgroundColor: WidgetStateProperty.resolveWith((states) {
        // Disabled
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.surface;
        }

        // Pressed
        if (states.contains(WidgetState.pressed)) {
          return colorScheme.surface.withValues(alpha: 0.65);
        }

        // Hovered
        if (states.contains(WidgetState.hovered)) {
          return colorScheme.surface.withValues(alpha: 0.92);
        }

        // Normal
        return colorScheme.surface;
      }),

      shape: WidgetStateProperty.resolveWith((states) {
        final disabled = states.contains(WidgetState.disabled);

        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
          side: BorderSide(
            color: colorScheme.outline.withValues(alpha: disabled ? 0.78 : 1.0),
          ),
        );
      }),

      foregroundColor: WidgetStateProperty.resolveWith((states) {
        final disabled = states.contains(WidgetState.disabled);

        return disabled ? colorScheme.onSurfaceVariant : colorScheme.onSurface;
      }),

      textStyle: WidgetStatePropertyAll(
        textThemeData(colorScheme).labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),

      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      ),
    ),
  );
}

TextButtonThemeData textButtonThemeData(ColorScheme colorScheme) {
  return TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),

      foregroundColor: WidgetStateProperty.resolveWith((states) {
        // Disabled
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.primary.withValues(alpha: 0.4);
        }

        // Pressed
        if (states.contains(WidgetState.pressed)) {
          return colorScheme.primary.withValues(alpha: 0.6);
        }

        // Hovered
        if (states.contains(WidgetState.hovered)) {
          return colorScheme.primary.withValues(alpha: 0.6);
        }

        // Normal
        return colorScheme.primary;
      }),

      textStyle: WidgetStatePropertyAll(
       textThemeData(colorScheme).labelLarge
      ),

      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
    ),
  );
}
