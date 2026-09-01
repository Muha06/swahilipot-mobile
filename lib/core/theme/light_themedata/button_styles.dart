import 'package:flutter/material.dart';
import 'package:swahilipothub/core/constants/colors/app_light_colors.dart';
import 'package:swahilipothub/core/constants/radius/app_radius.dart';
import 'package:swahilipothub/core/constants/spacing/app_spacing.dart';
import 'package:swahilipothub/core/theme/light_themedata/text_styles.dart';

final ElevatedButtonThemeData elevatedBtnThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      // Disabled
      if (states.contains(WidgetState.disabled)) {
        return AppLightColors.primary.withAlpha(100);
      }

      // Pressed
      if (states.contains(WidgetState.pressed)) {
        return AppLightColors.primary.withValues(alpha: 0.55);
      }

      // Hovered
      if (states.contains(WidgetState.hovered)) {
        return AppLightColors.primary.withValues(alpha: 0.92);
      }

      // Normal
      return AppLightColors.primary;
    }),

    foregroundColor: WidgetStateProperty.all(AppLightColors.surface),
    textStyle: WidgetStatePropertyAll(
      textThemeData.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),

    elevation: WidgetStateProperty.all(1),

    minimumSize: WidgetStateProperty.all(const Size(double.infinity, 52)),

    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
    ),

    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
    ),
  ),
);

final filledButtonThemeData = FilledButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      // Disabled
      if (states.contains(WidgetState.disabled)) {
        return AppLightColors.textSecondary;
      }

      // Pressed
      if (states.contains(WidgetState.pressed)) {
        return AppLightColors.textPrimary.withValues(alpha: 0.65);
      }

      // Hovered
      if (states.contains(WidgetState.hovered)) {
        return AppLightColors.textPrimary.withValues(alpha: 0.92);
      }

      // Normal
      return AppLightColors.textPrimary;
    }),

    foregroundColor: WidgetStateProperty.all(AppLightColors.surface),
    textStyle: WidgetStatePropertyAll(
      textThemeData.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),

    elevation: WidgetStateProperty.all(0),

    minimumSize: WidgetStateProperty.all(const Size(double.infinity, 52)),

    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
    ),

    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
    ),
  ),
);

final OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    elevation: WidgetStateProperty.all(0),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      // Disabled
      if (states.contains(WidgetState.disabled)) {
        return AppLightColors.background;
      }

      // Pressed
      if (states.contains(WidgetState.pressed)) {
        return AppLightColors.background.withValues(alpha: 0.65);
      }

      // Hovered
      if (states.contains(WidgetState.hovered)) {
        return AppLightColors.background.withValues(alpha: 0.92);
      }

      // Normal
      return AppLightColors.background;
    }),

    shape: WidgetStateProperty.resolveWith((states) {
      // Disabled
      if (states.contains(WidgetState.disabled)) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
          side: BorderSide(color: AppLightColors.border.withAlpha(200)),
        );
      }

      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        side: const BorderSide(color: AppLightColors.border),
      );
    }),

    foregroundColor: WidgetStateProperty.resolveWith((states) {
      final disabled = states.contains(WidgetState.disabled);

      return disabled
          ? AppLightColors.textSecondary
          : AppLightColors.textPrimary;
    }),

    textStyle: WidgetStateTextStyle.resolveWith((states) {
      final disabled = states.contains(WidgetState.disabled);

      return textThemeData.labelLarge!.copyWith(
        color: disabled
            ? AppLightColors.textSecondary
            : AppLightColors.textPrimary,
      );
    }),

    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
    ),
  ),
);

final textButtonTheme = TextButtonThemeData(
  style: ButtonStyle(
    backgroundColor: const WidgetStatePropertyAll(Colors.transparent),

    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppLightColors.primary.withValues(alpha: 0.4);
      }

      if (states.contains(WidgetState.pressed)) {
        return AppLightColors.primary.withValues(alpha: 0.6);
      }

      if (states.contains(WidgetState.hovered)) {
        return AppLightColors.primary.withValues(alpha: 0.6);
      }

      return AppLightColors.primary;
    }),
    textStyle: WidgetStatePropertyAll(
      textThemeData.labelLarge?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),

    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
  ),
);
