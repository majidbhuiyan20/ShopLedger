import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_ledger/core/routes/app_routes.dart';
import 'package:shop_ledger/features/widgets/primary_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../widgets/auth_background.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  final bool isPasswordReset;

  const OtpScreen({
    super.key,
    required this.email,
    this.isPasswordReset = false,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(6, (_) => TextEditingController());
    _focusNodes = List.generate(6, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _otpValue => _controllers.map((c) => c.text).join();

  bool get _isOtpComplete => _otpValue.length == 6;

  void _onOtpFieldChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (value.length > 1) {
        // If pasted multiple digits
        _controllers[index].text = value[0];
        if (index < 5) {
          _focusNodes[index + 1].requestFocus();
        }
      } else {
        // Move to next field
        if (index < 5) {
          _focusNodes[index + 1].requestFocus();
        }
      }
    } else if (value.isEmpty && index > 0) {
      // Handle backspace
      _controllers[index - 1].clear();
      _focusNodes[index - 1].requestFocus();
    }
    setState(() => _error = null);
  }

  Future<void> _verifyOtp() async {
    if (!_isOtpComplete) {
      setState(() => _error = 'Please enter all 6 digits');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    // TODO: API call to verify OTP
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _loading = false);

    if (mounted) {
      // Navigate to next screen based on flow
      if (widget.isPasswordReset) {
        // Password reset flow: go to reset password screen
        Navigator.pushNamed(
          context,
          Routes.resetPasswordRoute,
          arguments: {'email': widget.email, 'otp': _otpValue},
        );
      } else {
        // Register flow: go to login screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('OTP verified successfully!')),
        );
        Navigator.pushNamed(context, Routes.loginRoute);
      }
    }
  }

  void _resendOtp() {
    // Clear all fields
    for (var controller in _controllers) {
      controller.clear();
    }
    // Reset focus to first field
    _focusNodes[0].requestFocus();

    // TODO: API call to resend OTP
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP resent to your email')),
    );
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
              const SizedBox(height: 24),

              // ── Title ─────────────────────────────────────────
              Text('Verify OTP', style: AppTextStyle.h1),
              const SizedBox(height: 8),
              Text(
                'Enter the 6-digit code sent to ${widget.email}',
                style: AppTextStyle.bodyMedium,
              ),

              const SizedBox(height: 48),

              // ── OTP Input Fields ──────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: 50,
                    height: 60,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColors.borderDefault,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColors.primary,
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColors.danger,
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: AppColors.bgSurface,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: AppTextStyle.otpDigit,
                      cursorHeight: 20,
                      cursorWidth: 1,
                      cursorColor: AppColors.primary,
                      onChanged: (value) => _onOtpFieldChanged(value, index),
                    ),
                  ),
                ),
              ),

              // ── Error Message ─────────────────────────────────
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(
                  _error!,
                  style: AppTextStyle.inputError,
                ),
              ],

              const SizedBox(height: 40),

              // ── Verify Button ────────────────────────────────
              PrimaryButton(
                label: 'Verify OTP',
                loading: _loading,
                onTap: _isOtpComplete ? _verifyOtp : null,
              ),

              const SizedBox(height: 24),

              // ── Resend OTP Link ──────────────────────────────
              Center(
                child: Column(
                  children: [
                    Text(
                      "Didn't receive the code?",
                      style: AppTextStyle.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: _resendOtp,
                      child: Text(
                        'Resend OTP',
                        style: AppTextStyle.link,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // ── Timer (Optional) ──────────────────────────────
              Center(
                child: Text(
                  'Valid for 10 minutes',
                  style: AppTextStyle.caption,
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
