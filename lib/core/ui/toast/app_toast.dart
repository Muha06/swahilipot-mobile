import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

abstract final class AppToast {
  static void success(String message) {
    _show(message: message, type: ToastificationType.success);
  }

  static void error(String message) {
    _show(message: message, type: ToastificationType.error);
  }

  static void info(String message) {
    _show(message: message, type: ToastificationType.info);
  }

  static void warning(String message) {
    _show(message: message, type: ToastificationType.warning);
  }

  static void _show({
    required String message,
    required ToastificationType type,
  }) {
    toastification.show(
      type: type,
      style: ToastificationStyle.minimal,

      title: Text(message),

      alignment: Alignment.bottomCenter,

      autoCloseDuration: const Duration(seconds: 3),

      showIcon: true,

      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }
}
