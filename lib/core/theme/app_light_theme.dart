import 'package:flutter/material.dart';
import 'package:swahilipothub/core/constants/colors/app_light_colors.dart';
import 'package:swahilipothub/core/theme/themedatas/bottom_nav_bar.dart';
import 'package:swahilipothub/core/theme/themedatas/button_styles.dart';
import 'package:swahilipothub/core/theme/themedatas/card_theme.dart';
import 'package:swahilipothub/core/theme/themedatas/text_styles.dart';

ThemeData appLightTheme() {
  const colorScheme = ColorScheme.light(
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
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: colorScheme,

    scaffoldBackgroundColor: AppLightColors.background,

    appBarTheme: const AppBarThemeData(
      backgroundColor: AppLightColors.background,
      elevation: 3,
      toolbarHeight: 60,
      surfaceTintColor: Colors.transparent,
      shadowColor: AppLightColors.shadow,
    ),
    navigationBarTheme: bottomNavigationBarThemeData(colorScheme),
    elevatedButtonTheme: elevatedBtnThemeData(colorScheme),
    filledButtonTheme: filledButtonThemeData(colorScheme),
    outlinedButtonTheme: outlinedButtonThemeData(colorScheme),
    textButtonTheme: textButtonThemeData(colorScheme),

    cardTheme: cardThemeData(colorScheme),

    textTheme: textThemeData(colorScheme),
  );
}
