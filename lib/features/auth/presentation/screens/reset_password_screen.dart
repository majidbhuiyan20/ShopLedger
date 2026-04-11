import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/auth_background.dart';
import '../../../widgets/primary_button.dart';

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// Step 3 — Set New Password
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String otp;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.otp,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmController  = TextEditingController();

  bool    _obscurePass1    = true;
  bool    _obscurePass2    = true;
  bool    _loading         = false;
  bool    _success         = false;
  String? _passwordError;
  String? _confirmError;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    setState(() {
      _passwordError = null;
      _confirmError  = null;
    });

    if (_passwordController.text.length < 8) {
      setState(() => _passwordError = 'Password must be at least 8 characters');
      return;
    }
    if (_passwordController.text != _confirmController.text) {
      setState(() => _confirmError = 'Passwords do not match');
      return;
    }

    setState(() => _loading = true);

    // TODO: POST /api/v1/reset-password
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _loading = false;
      _success = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: _success
              ? null
              : IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary,
              size:  20,
            ),
          ),
        ),
        body: SafeArea(
          child: _success ? _buildSuccessState() : _buildFormState(),
        ),
      ),
    );
  }

  // ── Success State ─────────────────────────────────────
  Widget _buildSuccessState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width:      88,
            height:     88,
            decoration: BoxDecoration(
              color:        AppColors.successSurface,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(
              Icons.check_circle_outline_rounded,
              color: AppColors.success,
              size:  44,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Password Reset Successful! 🎉',
            style:     AppTextStyle.h2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Your password has been changed successfully. Now log in with your new password.',
            style:     AppTextStyle.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            label: 'Go to Login',
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.loginRoute,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  // ── Form State ────────────────────────────────────────
  Widget _buildFormState() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          Container(
            width:      64,
            height:     64,
            decoration: BoxDecoration(
              color:        AppColors.successSurface,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.lock_open_rounded,
              color: AppColors.success,
              size:  30,
            ),
          ),

          const SizedBox(height: 20),

          Text('Set New Password', style: AppTextStyle.h1),
          const SizedBox(height: 8),
          Text(
            'Create a new password for your account',
            style: AppTextStyle.bodyMedium,
          ),

          const SizedBox(height: 32),

          // New Password
          HInputField(
            label:      'New Password',
            hint:       'Min 8 characters',
            controller: _passwordController,
            obscure:    _obscurePass1,
            errorText:  _passwordError,
            onChanged:  (_) => setState(() {}),
            prefix: const Icon(
              Icons.lock_outline_rounded,
              color: AppColors.textTertiary,
              size:  20,
            ),
            suffix: IconButton(
              onPressed: () => setState(() => _obscurePass1 = !_obscurePass1),
              icon: Icon(
                _obscurePass1
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.textTertiary,
                size:  20,
              ),
            ),
          ),

          HPasswordStrength(password: _passwordController.text),

          const SizedBox(height: 16),

          // Confirm Password
          HInputField(
            label:      'Confirm Password',
            hint:       'Re-enter password',
            controller: _confirmController,
            obscure:    _obscurePass2,
            errorText:  _confirmError,
            prefix: const Icon(
              Icons.lock_outline_rounded,
              color: AppColors.textTertiary,
              size:  20,
            ),
            suffix: IconButton(
              onPressed: () => setState(() => _obscurePass2 = !_obscurePass2),
              icon: Icon(
                _obscurePass2
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.textTertiary,
                size:  20,
              ),
            ),
          ),

          const SizedBox(height: 32),

          PrimaryButton(
            label:   'Reset Password',
            loading: _loading,
            onTap:   _resetPassword,
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
