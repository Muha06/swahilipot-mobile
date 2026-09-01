import 'package:flutter/material.dart';
import 'package:swahilipothub/core/constants/colors/app_light_colors.dart';
import 'package:swahilipothub/core/constants/spacing/app_spacing.dart';

final cardThemeData = CardThemeData(
  color: AppLightColors.surface,
  shadowColor: AppLightColors.shadow,
  elevation: 2,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppSpacing.md),
    side: const BorderSide(color: AppLightColors.border),
  ),
);
