import 'package:flutter/material.dart';
import 'app_colors.dart';

/// ShopLedger App — Typography System
/// Font: PlusJakartaSans (clean, modern, readable)

class AppTextStyle {
  AppTextStyle._();

  static const String fontFamily = 'PlusJakartaSans';

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Display — Hero text, splash
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize:   40,
    fontWeight: FontWeight.w800,
    color:      AppColors.textPrimary,
    letterSpacing: -1.0,
    height:     1.1,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize:   32,
    fontWeight: FontWeight.w700,
    color:      AppColors.textPrimary,
    letterSpacing: -0.5,
    height:     1.2,
  );

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Heading — Screen titles
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize:   26,
    fontWeight: FontWeight.w700,
    color:      AppColors.textPrimary,
    letterSpacing: -0.3,
    height:     1.3,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize:   22,
    fontWeight: FontWeight.w700,
    color:      AppColors.textPrimary,
    letterSpacing: -0.2,
    height:     1.3,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize:   18,
    fontWeight: FontWeight.w600,
    color:      AppColors.textPrimary,
    height:     1.4,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize:   16,
    fontWeight: FontWeight.w600,
    color:      AppColors.textPrimary,
    height:     1.4,
  );

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Body — Content text
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize:   16,
    fontWeight: FontWeight.w400,
    color:      AppColors.textPrimary,
    height:     1.6,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize:   14,
    fontWeight: FontWeight.w400,
    color:      AppColors.textSecondary,
    height:     1.6,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize:   12,
    fontWeight: FontWeight.w400,
    color:      AppColors.textTertiary,
    height:     1.5,
  );

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Label — Form labels, tags
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize:   14,
    fontWeight: FontWeight.w500,
    color:      AppColors.textPrimary,
    height:     1.4,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize:   13,
    fontWeight: FontWeight.w500,
    color:      AppColors.textSecondary,
    height:     1.4,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize:   11,
    fontWeight: FontWeight.w500,
    color:      AppColors.textTertiary,
    letterSpacing: 0.3,
    height:     1.4,
  );

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Button
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize:   16,
    fontWeight: FontWeight.w600,
    color:      AppColors.textOnPrimary,
    letterSpacing: 0.2,
    height:     1.0,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize:   14,
    fontWeight: FontWeight.w600,
    color:      AppColors.textOnPrimary,
    letterSpacing: 0.2,
    height:     1.0,
  );

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Input
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const TextStyle inputText = TextStyle(
    fontFamily: fontFamily,
    fontSize:   15,
    fontWeight: FontWeight.w400,
    color:      AppColors.textPrimary,
    height:     1.4,
  );

  static const TextStyle inputHint = TextStyle(
    fontFamily: fontFamily,
    fontSize:   15,
    fontWeight: FontWeight.w400,
    color:      AppColors.textTertiary,
    height:     1.4,
  );

  static const TextStyle inputError = TextStyle(
    fontFamily: fontFamily,
    fontSize:   12,
    fontWeight: FontWeight.w400,
    color:      AppColors.danger,
    height:     1.4,
  );

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Special
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const TextStyle otpDigit = TextStyle(
    fontFamily: fontFamily,
    fontSize:   28,
    fontWeight: FontWeight.w700,
    color:      AppColors.primary,
    letterSpacing: 4,
  );

  static const TextStyle amount = TextStyle(
    fontFamily: fontFamily,
    fontSize:   24,
    fontWeight: FontWeight.w800,
    color:      AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle amountSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize:   16,
    fontWeight: FontWeight.w700,
    color:      AppColors.textPrimary,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize:   11,
    fontWeight: FontWeight.w400,
    color:      AppColors.textTertiary,
    height:     1.4,
  );

  static const TextStyle link = TextStyle(
    fontFamily: fontFamily,
    fontSize:   14,
    fontWeight: FontWeight.w500,
    color:      AppColors.primary,
    decoration: TextDecoration.none,
  );

  static const TextStyle logoText = TextStyle(
    fontFamily: fontFamily,
    fontSize:   28,
    fontWeight: FontWeight.w800,
    color:      AppColors.textOnPrimary,
    letterSpacing: 2,
  );
}