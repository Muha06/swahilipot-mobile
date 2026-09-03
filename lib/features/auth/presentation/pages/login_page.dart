import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:swahilipothub/core/constants/spacing/app_spacing.dart';
import 'package:swahilipothub/core/constants/strings/app_assets.dart';
import 'package:swahilipothub/core/navigation/app_navigator.dart';
import 'package:swahilipothub/core/ui/toast/app_toast.dart';
import 'package:swahilipothub/features/auth/domain/entities/dtos/login_dto.dart';
import 'package:swahilipothub/features/auth/presentation/pages/signup_page.dart';
import 'package:swahilipothub/features/auth/presentation/providers/auth_provider.dart';
import 'package:swahilipothub/features/auth/presentation/widgets/text_field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final dto = LoginDto(
      email: _emailController.text.trim().toLowerCase(),
      password: _passwordController.text,
    );

    ref.read(authProvider.notifier).signIn(dto);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.error != null && next.error != previous?.error) {
        AppToast.error(next.error!);
      }
    });

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
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                      ),
                    ),

                    const SizedBox(height: AppSpacing.massive),

                    AuthTextField(
                      controller: _emailController,
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
                      controller: _passwordController,
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
                        onPressed: authState.isLoading ? null : _login,
                        child: authState.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('Login'),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.xxxl),

                    RichText(
                      text: TextSpan(
                        style: theme.textTheme.bodyMedium,
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
