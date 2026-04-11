import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_outline_button.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey            = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _loading         = false;
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      _emailError    = null;
      _passwordError = null;
    });

    if (_emailController.text.trim().isEmpty) {
      setState(() => _emailError = 'Email is required');
      return;
    }
    if (_passwordController.text.isEmpty) {
      setState(() => _passwordError = 'Password is required');
      return;
    }

    setState(() => _loading = true);

    // TODO: API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _loading = false);

    // Navigate to home on success
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBase,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 48),

                // ── Logo + Title ──────────────────────────────────
                Row(
                  children: [
                    const HLogoMark(size: 48),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hisabi', style: AppTextStyle.h3),
                        Text('Business Management', style: AppTextStyle.bodySmall),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                Text('Welcome Back 👋', style: AppTextStyle.h1),
                const SizedBox(height: 8),
                Text(
                  'Login to your account',
                  style: AppTextStyle.bodyMedium,
                ),

                const SizedBox(height: 36),

                // ── Email ─────────────────────────────────────────
                HInputField(
                  label:          'Email',
                  hint:           'Enter your email address',
                  controller:     _emailController,
                  keyboardType:   TextInputType.emailAddress,
                  errorText:      _emailError,
                  prefix: const Icon(
                    Icons.mail_outline_rounded,
                    color: AppColors.textTertiary,
                    size: 20,
                  ),
                ),

                const SizedBox(height: 16),

                // ── Password ──────────────────────────────────────
                HInputField(
                  label:      'Password',
                  hint:       'Enter your password',
                  controller: _passwordController,
                  obscure:    _obscurePassword,
                  errorText:  _passwordError,
                  prefix: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.textTertiary,
                    size: 20,
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
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // ── Forgot Password ───────────────────────────────
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to forgot password
                    },
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyle.link,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // ── Login Button ──────────────────────────────────
                PrimaryButton(
                  label:   'Login',
                  loading: _loading,
                  onTap:   _login,
                ),

                const SizedBox(height: 20),

                // ── Divider ───────────────────────────────────────
                const HDividerText(),

                const SizedBox(height: 20),

                // ── Google Login ──────────────────────────────────
                PrimaryOutlineButton(
                  label: 'Login with Google',
                  onTap: () {
                    // TODO: Google Sign In
                  },
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

                const SizedBox(height: 32),

                // ── Register Link ─────────────────────────────────
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: AppTextStyle.bodyMedium,
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to register
                            },
                            child: Text(
                              'Sign Up',
                              style: AppTextStyle.link,
                            ),
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