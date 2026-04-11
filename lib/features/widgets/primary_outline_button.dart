import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_style.dart';
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// Outline Button
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class PrimaryOutlineButton extends StatelessWidget {
  final String       label;
  final VoidCallback? onTap;
  final Widget?      leading;
  final Color?       borderColor;
  final Color?       textColor;
  final double       height;

  const PrimaryOutlineButton({
    super.key,
    required this.label,
    this.onTap,
    this.leading,
    this.borderColor,
    this.textColor,
    this.height = 54,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  double.infinity,
      height: height,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          side: BorderSide(
            color: borderColor ?? AppColors.borderDefault,
            width: 1.5,
          ),
          backgroundColor: AppColors.bgSurface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 10)],
            Text(
              label,
              style: AppTextStyle.buttonLarge.copyWith(
                color: textColor ?? AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
