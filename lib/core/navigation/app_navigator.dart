import 'package:flutter/material.dart';
import 'package:swahilipothub/core/keys/naigation_keys.dart';

class AppNavigator {
  static NavigatorState get _navigator => navigatorKey.currentState!;

  static Future<T?> push<T>(Widget page) {
    return _navigator.push<T>(MaterialPageRoute(builder: (_) => page));
  }

  static void pop<T extends Object?>([T? result]) {
    _navigator.pop<T>(result);
  }

  static Future<T?> pushReplacement<T>(Widget page) {
    return _navigator.pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  static Future<T?> pushAndRemoveUntil<T>(Widget page) {
    return _navigator.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  static bool canPop() {
    return _navigator.canPop();
  }

  static void popUntil(RoutePredicate predicate) {
    _navigator.popUntil(predicate);
  }
}
