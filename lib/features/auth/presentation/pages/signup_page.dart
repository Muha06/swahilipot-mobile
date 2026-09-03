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
import 'package:swahilipothub/features/auth/domain/entities/dtos/signup_dto.dart';
import 'package:swahilipothub/features/auth/presentation/providers/auth_provider.dart';
import 'package:swahilipothub/features/auth/presentation/widgets/text_field.dart';
import 'package:swahilipothub/features/home/presentation/pages/home_page.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _signUp() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final dto = SignupDto(
      fullName: _fullNameController.text.trim(),
      email: _emailController.text.trim().toLowerCase(),
      password: _passwordController.text,
    );

    ref.read(authProvider.notifier).signUp(dto);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const iconWeight = FontWeight.w700;

    final authState = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.error != null && next.error != previous?.error) {
        AppToast.error(next.error!);
      }

      if (next.user != null && next.user != previous?.user) {
        AppNavigator.pushReplacement(const HomePage());
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.pageHorizontal,
        ),
        child: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    AppAssets.swahiliPotLogo,
                    width: 200,
                  ).animate().scale(
                    begin: const Offset(0.9, 0.9),
                    end: const Offset(1.0, 1.0),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOutBack,
                  ),

                  const SizedBox(height: AppSpacing.massive),

                  Text(
                    'Join SwahiliPot and Connect, Collaborate, and Grow',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxl),

                  // Full name
                  AuthTextField(
                    controller: _fullNameController,
                    label: 'Full Name',
                    prefixIcon: const Icon(
                      HugeIconsStroke.user,
                      fontWeight: iconWeight,
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Full name is required';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: AppSpacing.md),

                  // Email
                  AuthTextField(
                    controller: _emailController,
                    label: 'Email',
                    prefixIcon: const Icon(
                      HugeIconsStroke.mail01,
                      fontWeight: iconWeight,
                    ),
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
                    controller: _passwordController,
                    prefixIcon: const Icon(
                      HugeIconsStroke.securityPassword,
                      fontWeight: iconWeight,
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.next,
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

                  const SizedBox(height: AppSpacing.md),

                  AuthTextField(
                    controller: _confirmPasswordController,
                    label: 'Confirm Password',
                    prefixIcon: const Icon(
                      HugeIconsStroke.securityPassword,
                      fontWeight: FontWeight.w700,
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password confirmation is required';
                      }

                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }

                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: AppSpacing.xxxl),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: authState.isLoading ? null : _signUp,
                      child: authState.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Sign Up'),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxxl),

                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: theme.textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: 'Login',
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              AppNavigator.pop();
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
    );
  }
}
