import 'package:flutter/material.dart';

NavigationBarThemeData bottomNavigationBarThemeData(ColorScheme cs) {
  return NavigationBarThemeData(
    backgroundColor: cs.surface,
    indicatorColor: cs.primary,
    iconTheme: WidgetStateProperty.resolveWith((states) {
      return IconThemeData(
        color: states.contains(WidgetState.selected)
            ? cs.onPrimary
            : cs.onSurfaceVariant,
      );
    }),

    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      return TextStyle(
        color: states.contains(WidgetState.selected)
            ? cs.onSurface
            : cs.onSurfaceVariant,
        fontSize: 14,
        fontWeight: states.contains(WidgetState.selected)
            ? FontWeight.w500
            : FontWeight.w400,
      );
    }),
  );
}
