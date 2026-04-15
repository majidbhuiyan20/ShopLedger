import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_style.dart';



// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// Input Field
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class HInputField extends StatelessWidget {
  final String          label;
  final String          hint;
  final TextEditingController? controller;
  final bool            obscure;
  final Widget?         suffix;
  final Widget?         prefix;
  final TextInputType?  keyboardType;
  final String?         errorText;
  final VoidCallback?   onTap;
  final bool            readOnly;
  final int             maxLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const HInputField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.obscure      = false,
    this.suffix,
    this.prefix,
    this.keyboardType,
    this.errorText,
    this.onTap,
    this.readOnly     = false,
    this.maxLines     = 1,
    this.onChanged, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.labelMedium),
        const SizedBox(height: 6),
        TextFormField(
          controller:   controller,
          obscureText:  obscure,
          keyboardType: keyboardType,
          readOnly:     readOnly,
          maxLines:     maxLines,
          onTap:        onTap,
          onChanged:    onChanged,
          style:        AppTextStyle.inputText,
          decoration:   InputDecoration(
            hintText:     hint,
            hintStyle:    AppTextStyle.inputHint,
            suffixIcon:   suffix,
            prefixIcon:   prefix,
            errorText:    errorText,
            errorStyle:   AppTextStyle.inputError,
          ),
        ),
      ],
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// Divider with text
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class HDividerText extends StatelessWidget {
  final String text;
  const HDividerText({super.key, this.text = 'Or'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.borderDefault)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child:   Text(text, style: AppTextStyle.bodySmall),
        ),
        const Expanded(child: Divider(color: AppColors.borderDefault)),
      ],
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// Logo Mark Widget
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class HLogoMark extends StatelessWidget {
  final double size;
  const HLogoMark({super.key, this.size = 56});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:        size,
      height:       size,
      decoration:   BoxDecoration(
        gradient:     AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(size * 0.28),
      ),
      child: Center(
        child: Text(
          'SL',
          style: AppTextStyle.logoText.copyWith(fontSize: size * 0.5),
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// Password Strength Bar
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class HPasswordStrength extends StatelessWidget {
  final String password;
  const HPasswordStrength({super.key, required this.password});

  int get _strength {
    if (password.length < 6) return 0;
    int score = 0;
    if (password.length >= 8)                                    score++;
    if (RegExp(r'[A-Z]').hasMatch(password))                     score++;
    if (RegExp(r'[0-9]').hasMatch(password))                     score++;
    if (RegExp(r'[!@#\$&*~%^()_\-+=]').hasMatch(password))      score++;
    return score;
  }

  Color get _color {
    switch (_strength) {
      case 1:  return AppColors.danger;
      case 2:  return AppColors.warning;
      case 3:  return AppColors.warningLight;
      case 4:  return AppColors.success;
      default: return AppColors.borderDefault;
    }
  }

  String get _label {
    switch (_strength) {
      case 1:  return 'Weak';
      case 2:  return 'Fair';
      case 3:  return 'Good';
      case 4:  return 'Strong';
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (password.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          children: List.generate(4, (i) => Expanded(
            child: Container(
              margin: EdgeInsets.only(right: i < 3 ? 4 : 0),
              height: 4,
              decoration: BoxDecoration(
                color:        i < _strength ? _color : AppColors.borderDefault,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          )),
        ),
        const SizedBox(height: 4),
        Text(_label, style: AppTextStyle.caption.copyWith(color: _color)),
      ],
    );
  }
}