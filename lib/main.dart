import 'package:flutter/material.dart';
import 'package:swahilipothub/core/keys/naigation_keys.dart';
import 'package:swahilipothub/core/theme/app_dark_theme.dart';
import 'package:swahilipothub/core/theme/app_light_theme.dart';
import 'package:swahilipothub/features/auth/presentation/pages/login_page.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        title: 'SwahiliPot Hub',
        theme: appLightTheme,
        debugShowCheckedModeBanner: false,
        darkTheme: appDarkTheme,
        themeMode: ThemeMode.system,
        navigatorKey: navigatorKey,
        home: const LoginPage(),
      ),
    );
  }
}
