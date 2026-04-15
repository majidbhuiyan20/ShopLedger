import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ledger/core/routes/app_routes.dart';
import 'package:shop_ledger/features/widgets/primary_button.dart';
import 'package:shop_ledger/features/widgets/primary_outline_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/auth_background.dart';
import '../view_model/sign_up_provider.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _agreedToTerms   = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Handle register button tap
  void _handleRegister() async {
    final viewModel = ref.read(signUpProvider.notifier);
    
    // Validate form
    final isValid = viewModel.validateForm(
      _usernameController.text,
      _emailController.text,
      _passwordController.text,
      _agreedToTerms,
    );

    if (!isValid) {
      // Rebuild to show errors
      setState(() {});
      return;
    }

    // Call signup API
    final success = await viewModel.signup(
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (!mounted) return;

    if (success) {
      // Mark OTP as sent and navigate to OTP screen
      viewModel.markOtpSent();
      Navigator.pushNamed(
        context,
        Routes.otpRoute,
        arguments: {
          'email': _emailController.text,
          'isPasswordReset': false,
        },
      );
    } else {
      // Show error snackbar
      final state = ref.read(signUpProvider);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error ?? 'Registration failed'),
          backgroundColor: AppColors.danger,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch signup state for reactive updates
    final signupState = ref.watch(signUpProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AuthBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),

                Text('Create Account 🏪', style: AppTextStyle.h1),
                const SizedBox(height: 8),
                Text(
                  'Sign up with your business details',
                  style: AppTextStyle.bodyMedium,
                ),

                const SizedBox(height: 32),

                // ── Full Name ──────────────────────────────────
                HInputField(
                  label: 'Full Name',
                  hint: 'Enter full name',
                  controller: _fullNameController,
                  prefix: const Icon(
                    Icons.person_outline_rounded,
                    color: AppColors.textTertiary,
                    size: 20,
                  ),
                ),

                const SizedBox(height: 16),

                // ── Username ───────────────────────────────────
                HInputField(
                  label: 'Username',
                  hint: 'your_username',
                  controller: _usernameController,
                  errorText: signupState.usernameError,
                  prefix: const Icon(
                    Icons.person_outline_rounded,
                    color: AppColors.textTertiary,
                    size: 20,
                  ),
                ),

                const SizedBox(height: 16),

                // ── Email ──────────────────────────────────────
                HInputField(
                  label: 'Email',
                  hint: 'example@email.com',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  errorText: signupState.emailError,
                  prefix: const Icon(
                    Icons.mail_outline_rounded,
                    color: AppColors.textTertiary,
                    size: 20,
                  ),
                ),

                const SizedBox(height: 16),

                // ── Password ───────────────────────────────────
                HInputField(
                  label: 'Password',
                  hint: 'Min 8 characters',
                  controller: _passwordController,
                  obscure: _obscurePassword,
                  errorText: signupState.passwordError,
                  onChanged: (_) => setState(() {}),
                  prefix: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.textTertiary,
                    size: 20,
                  ),
                  suffix: IconButton(
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textTertiary,
                      size: 20,
                    ),
                  ),
                ),

                // Password strength bar
                HPasswordStrength(password: _passwordController.text),

                const SizedBox(height: 20),

                // ── Terms Checkbox ────────────────────────────
                GestureDetector(
                  onTap: () =>
                      setState(() => _agreedToTerms = !_agreedToTerms),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: _agreedToTerms
                              ? AppColors.primary
                              : AppColors.bgSurface,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: signupState.termsError != null
                                ? AppColors.danger
                                : _agreedToTerms
                                    ? AppColors.primary
                                    : AppColors.borderDefault,
                            width: 1.5,
                          ),
                        ),
                        child: _agreedToTerms
                            ? const Icon(Icons.check,
                                size: 14, color: Colors.white)
                            : null,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'I agree to the ',
                            style: AppTextStyle.bodyMedium,
                            children: [
                              TextSpan(
                                text: 'Terms of Service',
                                style: AppTextStyle.link,
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: AppTextStyle.link,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                if (signupState.termsError != null) ...[
                  const SizedBox(height: 4),
                  Text(signupState.termsError!,
                      style: AppTextStyle.inputError),
                ],

                const SizedBox(height: 28),

                // ── Register Button ───────────────────────────
                PrimaryButton(
                  label: signupState.isLoading ? 'Creating Account...' : 'Create Account',
                  loading: signupState.isLoading,
                  onTap: signupState.isLoading ? null : _handleRegister,
                ),

                const SizedBox(height: 20),

                // ── Divider ────────────────────────────────────
                const HDividerText(),

                const SizedBox(height: 20),

                // ── Google Register ────────────────────────────
                PrimaryOutlineButton(
                  label: 'Continue with Google',
                  onTap: () {},
                  leading: Image.network(
                    'https://www.google.com/favicon.ico',
                    width: 20,
                    height: 20,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.g_mobiledata,
                      color: AppColors.primary,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // ── Login Link ─────────────────────────────────
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: AppTextStyle.bodyMedium,
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Text('Login', style: AppTextStyle.link),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
