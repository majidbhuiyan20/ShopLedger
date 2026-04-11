import 'package:flutter/material.dart';
import 'package:shop_ledger/core/routes/app_routes.dart';
import 'package:shop_ledger/features/widgets/primary_button.dart';
import 'package:shop_ledger/features/widgets/primary_outline_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/auth_background.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _loading         = false;
  bool _agreedToTerms   = false;

  String? _usernameError;
  String? _emailError;
  String? _passwordError;
  String? _termsError;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    setState(() {
      _usernameError = null;
      _emailError    = null;
      _passwordError = null;
      _termsError    = null;
    });

    bool hasError = false;
    if (_usernameController.text.trim().length < 3) {
      setState(() => _usernameError = 'Username must be at least 3 characters');
      hasError = true;
    }
    if (_emailController.text.trim().isEmpty) {
      setState(() => _emailError = 'Email is required');
      hasError = true;
    }
    if (_passwordController.text.length < 8) {
      setState(() => _passwordError = 'Password must be at least 8 characters');
      hasError = true;
    }
    if (!_agreedToTerms) {
      setState(() => _termsError = 'You must agree to the terms');
      hasError = true;
    }
    if (hasError) return;

    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _loading = false);

    // Navigate to OTP screen
    Navigator.pushNamed(context, Routes.otpRoute, arguments: _emailController.text);
  }

  @override
  Widget build(BuildContext context) {
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

              // ── Username ──────────────────────────────────────
              HInputField(
                label:      'Username',
                hint:       'your_username',
                controller: _usernameController,
                errorText:  _usernameError,
                prefix: const Icon(
                  Icons.person_outline_rounded,
                  color: AppColors.textTertiary,
                  size:  20,
                ),
              ),

              const SizedBox(height: 16),

              // ── Email ─────────────────────────────────────────
              HInputField(
                label:        'Email',
                hint:         'example@email.com',
                controller:   _emailController,
                keyboardType: TextInputType.emailAddress,
                errorText:    _emailError,
                prefix: const Icon(
                  Icons.mail_outline_rounded,
                  color: AppColors.textTertiary,
                  size:  20,
                ),
              ),

              const SizedBox(height: 16),

              // ── Password ──────────────────────────────────────
              HInputField(
                label:      'Password',
                hint:       'Min 8 characters',
                controller: _passwordController,
                obscure:    _obscurePassword,
                errorText:  _passwordError,
                onChanged:  (_) => setState(() {}),
                prefix: const Icon(
                  Icons.lock_outline_rounded,
                  color: AppColors.textTertiary,
                  size:  20,
                ),
                suffix: IconButton(
                  onPressed: () => setState(
                        () => _obscurePassword = !_obscurePassword,
                  ),
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.textTertiary,
                    size:  20,
                  ),
                ),
              ),

              // Password strength bar
              HPasswordStrength(password: _passwordController.text),

              const SizedBox(height: 20),

              // ── Terms Checkbox ────────────────────────────────
              GestureDetector(
                onTap: () => setState(() => _agreedToTerms = !_agreedToTerms),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration:     const Duration(milliseconds: 200),
                      width:        20,
                      height:       20,
                      decoration:   BoxDecoration(
                        color:        _agreedToTerms
                            ? AppColors.primary
                            : AppColors.bgSurface,
                        borderRadius: BorderRadius.circular(6),
                        border:       Border.all(
                          color: _termsError != null
                              ? AppColors.danger
                              : _agreedToTerms
                              ? AppColors.primary
                              : AppColors.borderDefault,
                          width: 1.5,
                        ),
                      ),
                      child: _agreedToTerms
                          ? const Icon(Icons.check, size: 14, color: Colors.white)
                          : null,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text:  'I agree to the ',
                          style: AppTextStyle.bodyMedium,
                          children: [
                            TextSpan(
                              text:  'Terms of Service',
                              style: AppTextStyle.link,
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text:  'Privacy Policy',
                              style: AppTextStyle.link,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              if (_termsError != null) ...[
                const SizedBox(height: 4),
                Text(_termsError!, style: AppTextStyle.inputError),
              ],

              const SizedBox(height: 28),

              // ── Register Button ───────────────────────────────
              PrimaryButton(
                label:   'Create Account',
                loading: _loading,
                onTap:   _register,
              ),

              const SizedBox(height: 20),

              // ── Divider ───────────────────────────────────────
              const HDividerText(),

              const SizedBox(height: 20),

              // ── Google Register ───────────────────────────────
              PrimaryOutlineButton(
                label: 'Continue with Google',
                onTap: () {},
                leading: Image.network(
                  'https://www.google.com/favicon.ico',
                  width:  20,
                  height: 20,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.g_mobiledata,
                    color: AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ── Login Link ────────────────────────────────────
              Center(
                child: RichText(
                  text: TextSpan(
                    text:  'Already have an account? ',
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
    ));
  }
}