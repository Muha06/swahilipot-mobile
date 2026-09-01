import 'package:flutter/material.dart';
import 'package:swahilipothub/core/constants/colors/app_light_colors.dart';
import 'package:swahilipothub/core/keys/naigation_keys.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:swahilipothub/core/navigation/app_navigator.dart';

abstract final class AppDialog {
  static BuildContext get _context =>
      navigatorKey.currentState!.overlay!.context;

  // CONFIRM DIALOG
  static Future<bool> confirm({
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    IconData? icon,
  }) async {
    final result = await showDialog<bool>(
      context: _context,
      builder: (context) => AlertDialog(
        icon: icon != null ? Icon(icon) : null,

        title: Text(title, textAlign: TextAlign.center),

        content: Text(message, textAlign: TextAlign.center),

        actionsAlignment: MainAxisAlignment.center,

        actions: [
          OutlinedButton(
            onPressed: () => AppNavigator.pop(false),
            child: Text(cancelText),
          ),
          FilledButton(
            onPressed: () => AppNavigator.pop(true),
            child: Text(confirmText),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  // ERROR DIALOG
  static Future<void> error({
    required String title,
    required String message,
    String buttonText = 'OK',
  }) {
    final theme = Theme.of(_context);

    return showDialog(
      context: _context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            HugeIconsSolid.alert01,
            color: AppLightColors.error,
            size: 84,
          ),

          title: Text(
            title,
            textAlign: TextAlign.center,
            style: theme.dialogTheme.titleTextStyle?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Text(message, textAlign: TextAlign.center),

          actionsAlignment: MainAxisAlignment.center,

          actions: [
            FilledButton(
              onPressed: () => AppNavigator.pop(context),
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }

  // SUCCESS DIALOG
  static Future<void> success({
    required String title,
    required String message,
    String buttonText = 'OK',
  }) {
    return showDialog(
      context: _context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            HugeIconsSolid.checkmarkBadge01,
            color: AppLightColors.success,
            size: 84,
          ),
          title: Text(title, textAlign: TextAlign.center),
          content: Text(message, textAlign: TextAlign.center),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            FilledButton(
              onPressed: () => AppNavigator.pop(),
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }
}
