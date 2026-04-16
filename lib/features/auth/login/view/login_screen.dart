import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ledger/features/auth/login/view_model/login_view_model.dart';
import 'package:shop_ledger/features/widgets/app_validators.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/primary_outline_button.dart';
import '../../../widgets/auth_background.dart';


class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey            = GlobalKey<FormState>();

  bool _obscurePassword = true;
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      final viewModel = ref.read(loginViewModelProvider.notifier);
      viewModel.login(
        _emailController.text,
        _passwordController.text,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
      final loginState = ref.watch(loginViewModelProvider);
      if (loginState.isSuccess) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        });
      }
      if(loginState.error != null){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(loginState.error!))
        );
      }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AuthBackground(
        child: SafeArea(
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
                  validator: AppValidators.email,
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
                  validator: AppValidators.password,
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
                      Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyle.link,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // ── Login Button ──────────────────────────────────
                  // ── Login Button ──────────────────────────────────
                  PrimaryButton(
                    label: 'Login',
                    loading: loginState.isLoading,
                    onTap: loginState.isLoading ? null : _handleLogin,
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
                              Navigator.pushNamed(context, Routes.registerRoute);
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
    ));
  }
}