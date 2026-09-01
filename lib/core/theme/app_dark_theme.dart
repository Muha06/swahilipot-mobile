import 'package:flutter/material.dart';
import 'package:swahilipothub/core/constants/colors/app_dark_colors.dart';

final ThemeData appDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  colorScheme: const ColorScheme.dark(
    primary: AppDarkColors.primary,
    // Add the rest as we define the dark palette.
  ),
);
