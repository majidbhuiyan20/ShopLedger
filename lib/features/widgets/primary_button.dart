import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_style.dart';
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// Primary Button
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
class PrimaryButton extends StatelessWidget {
  final String     label;
  final VoidCallback? onTap;
  final bool       loading;
  final Color?     color;
  final Color?     textColor;
  final double     height;
  final IconData?  icon;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.loading  = false,
    this.color,
    this.textColor,
    this.height   = 54,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: loading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
          disabledBackgroundColor: AppColors.primaryLight,
        ),
        child: loading
            ? const SizedBox(
          width:  22,
          height: 22,
          child:  CircularProgressIndicator(
            strokeWidth: 2.5,
            color:       AppColors.textOnPrimary,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20, color: textColor ?? AppColors.textOnPrimary),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: AppTextStyle.buttonLarge.copyWith(
                color: textColor ?? AppColors.textOnPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}