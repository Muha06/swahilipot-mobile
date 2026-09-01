import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.prefixIcon,
    this.onChanged,
    this.textCapitalization,
  });

  final Widget? prefixIcon;
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      textCapitalization: textCapitalization ?? TextCapitalization.none,

      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,

        // Remove the default filled/outlined appearance.
        filled: false,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.outline),
        ),

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.outline),
        ),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),

        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.error),
        ),

        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.error, width: 2),
        ),

        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.onSurfaceVariant,
        ),

        floatingLabelStyle: theme.textTheme.labelLarge?.copyWith(
          color: colors.primary,
        ),
      ),
    );
  }
}
