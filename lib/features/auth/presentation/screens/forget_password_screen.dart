import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/auth_background.dart';
import '../../../widgets/primary_button.dart';

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// Step 1 — Enter Your Email
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool    _loading       = false;
  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendOTP() async {
    setState(() => _emailError = null);

    if (_emailController.text.trim().isEmpty) {
      setState(() => _emailError = 'Email is required');
      return;
    }

    setState(() => _loading = true);

    // TODO: POST /api/v1/forgot-password
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _loading = false);

    // Navigate to OTP screen with password reset flag
    if (!mounted) return;
    Navigator.pushNamed(
      context,
      Routes.otpRoute,
      arguments: {'email': _emailController.text.trim(), 'isPasswordReset': true},
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary,
              size:  20,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 16),

                // ── Icon ──────────────────────────────────────────
                Container(
                  width:      64,
                  height:     64,
                  decoration: BoxDecoration(
                    color:        AppColors.warningSurface,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.lock_reset_rounded,
                    color: AppColors.warning,
                    size:  30,
                  ),
                ),

                const SizedBox(height: 20),

                Text('Password Reset', style: AppTextStyle.h1),
                const SizedBox(height: 8),
                Text(
                  'Enter your registered email. We\'ll send you a reset code.',
                  style: AppTextStyle.bodyMedium,
                ),

                const SizedBox(height: 32),

                HInputField(
                  label:        'Registered Email',
                  hint:         'rahim@gmail.com',
                  controller:   _emailController,
                  keyboardType: TextInputType.emailAddress,
                  errorText:    _emailError,
                  prefix: const Icon(
                    Icons.mail_outline_rounded,
                    color: AppColors.textTertiary,
                    size:  20,
                  ),
                ),

                const SizedBox(height: 12),

                // ── Info Card ─────────────────────────────────────
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color:        AppColors.primarySurface,
                    borderRadius: BorderRadius.circular(12),
                    border:       Border.all(color: AppColors.primaryBorder),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.info_outline_rounded,
                        color: AppColors.primary,
                        size:  18,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Even if the email isn\'t registered, we\'ll send the same response for security.',
                          style: AppTextStyle.bodySmall.copyWith(
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                PrimaryButton(
                  label: 'Send Reset Code',
                  loading: _loading,
                  onTap: _sendOTP,
                ),

                const SizedBox(height: 16),

                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text('Back to Login', style: AppTextStyle.link),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}