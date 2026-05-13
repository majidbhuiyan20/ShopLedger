import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_style.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback? onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText = "সব দেখুন",
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            fontFamily: AppTextStyle.banglaFontFamily,
          ),
        ),
        const Spacer(),
        if (onActionTap != null)
          TextButton(
            onPressed: onActionTap,
            child: Text(
              actionText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontFamily: AppTextStyle.banglaFontFamily,
              ),
            ),
          ),
      ],
    );
  }
}