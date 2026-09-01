import 'package:flutter/material.dart';

abstract final class AppSheet {
  static Future<bool> confirm({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    IconData? icon,
  }) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        final colors = Theme.of(context).colorScheme;

        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: colors.outlineVariant,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),

              const SizedBox(height: 24),

              if (icon != null) ...[
                Icon(icon, size: 32),
                const SizedBox(height: 16),
              ],

              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              Text(message, textAlign: TextAlign.center),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(confirmText),
                ),
              ),

              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(cancelText),
              ),
            ],
          ),
        );
      },
    );

    return result ?? false;
  }

  static Future<T?> normalSheet<T>({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = true,
    bool useSafeArea = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      useSafeArea: useSafeArea,
      builder: (context) => child,
    );
  }
}
