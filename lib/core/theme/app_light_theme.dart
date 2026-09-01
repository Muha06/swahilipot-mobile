import 'package:flutter/material.dart';
import 'package:swahilipothub/core/constants/colors/app_light_colors.dart';
import 'package:swahilipothub/core/theme/light_themedata/button_styles.dart';
import 'package:swahilipothub/core/theme/light_themedata/card_theme.dart';
import 'package:swahilipothub/core/theme/light_themedata/text_styles.dart';

final ThemeData appLightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  colorScheme: const ColorScheme.light(
    primary: AppLightColors.primary,
    surface: AppLightColors.surface,
    onSurface: AppLightColors.textPrimary,
    surfaceContainerHigh: AppLightColors.surfaceHighest,
    surfaceContainerHighest: AppLightColors.surfaceHighest,
    error: AppLightColors.error,
    onError: AppLightColors.surface,
    errorContainer: AppLightColors.error,
    shadow: AppLightColors.shadow,
    onPrimary: AppLightColors.surface,
    onSurfaceVariant: AppLightColors.textSecondary,
  ),

  scaffoldBackgroundColor: AppLightColors.background,

  appBarTheme: const AppBarThemeData(
    backgroundColor: AppLightColors.background,
    elevation: 3,
    toolbarHeight: 60,
    surfaceTintColor: Colors.transparent,
    shadowColor: AppLightColors.shadow,
  ),

  elevatedButtonTheme: elevatedBtnThemeData,
  filledButtonTheme: filledButtonThemeData,
  outlinedButtonTheme: outlinedButtonThemeData,
  textButtonTheme: textButtonTheme,

  cardTheme: cardThemeData,

  textTheme: textThemeData,
);
