import 'package:flutter/material.dart';
import 'package:swahilipothub/core/constants/colors/app_dark_colors.dart';
import 'package:swahilipothub/core/theme/themedatas/button_styles.dart';
import 'package:swahilipothub/core/theme/themedatas/card_theme.dart';
import 'package:swahilipothub/core/theme/themedatas/text_styles.dart';

ThemeData appDarkTheme() {
  const scheme = ColorScheme.dark(
    primary: AppDarkColors.primary,
    surface: AppDarkColors.surface,
    onSurface: AppDarkColors.textPrimary,
    surfaceContainerHigh: AppDarkColors.surfaceHighest,
    surfaceContainerHighest: AppDarkColors.surfaceHighest,
    error: AppDarkColors.error,
    onError: AppDarkColors.surface,
    errorContainer: AppDarkColors.error,
    shadow: AppDarkColors.shadow,
    onPrimary: AppDarkColors.surface,
    onSurfaceVariant: AppDarkColors.textSecondary,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: scheme,

    scaffoldBackgroundColor: AppDarkColors.background,

    appBarTheme: const AppBarThemeData(
      backgroundColor: AppDarkColors.background,
      elevation: 3,
      toolbarHeight: 60,
      surfaceTintColor: Colors.transparent,
      shadowColor: AppDarkColors.shadow,
    ),

    elevatedButtonTheme: elevatedBtnThemeData(scheme),
    filledButtonTheme: filledButtonThemeData(scheme),
    outlinedButtonTheme: outlinedButtonThemeData(scheme),
    textButtonTheme: textButtonThemeData(scheme),

    cardTheme: cardThemeData(scheme),

    textTheme: textThemeData(scheme),
  );
}
