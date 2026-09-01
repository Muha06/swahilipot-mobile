import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:swahilipothub/core/constants/spacing/app_spacing.dart';
import 'package:swahilipothub/core/constants/strings/app_assets.dart';
import 'package:swahilipothub/core/navigation/app_navigator.dart';
import 'package:swahilipothub/features/auth/presentation/pages/signup_page.dart';
import 'package:swahilipothub/features/auth/presentation/widgets/text_field.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  void _login() {
    // Login logic will go here.
    if (!_formKey.currentState!.validate()) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.pageHorizontal,
          ),
          child: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo
                    Image.asset(
                      AppAssets.swahiliPotLogo,
                      width: 200,
                    ).animate().scale(
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1.0, 1.0),
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOutBack,
                    ),

                    const SizedBox(height: AppSpacing.massive),

                    Text(
                      'Log in to your account',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                      ),
                    ),

                    const SizedBox(height: AppSpacing.massive),

                    AuthTextField(
                      label: 'Email',
                      prefixIcon: const Icon(HugeIconsSolid.user),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email is required';
                        }

                        final email = value.trim().toLowerCase();

                        if (!email.endsWith('@swahilipot.co.ke')) {
                          return 'Use your SwahiliPot email';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: AppSpacing.md),

                    AuthTextField(
                      label: 'Password',
                      prefixIcon: const Icon(HugeIconsSolid.securityPassword),
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }

                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: AppSpacing.xxxl),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _login,
                        child: const Text('Login'),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.xxxl),

                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: theme.textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text: 'Create one',
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to signup
                                AppNavigator.push(const SignupPage());
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
