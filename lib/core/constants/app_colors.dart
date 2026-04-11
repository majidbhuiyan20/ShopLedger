import 'package:flutter/material.dart';

/// Primary: Deep Indigo (trust, finance)
/// Accent:  Emerald (success, money)
/// Neutral: Warm Gray (comfortable reading)

class AppColors {
  AppColors._();

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Primary — Deep Indigo
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const Color primary        = Color(0xFF4F46E5); // main buttons, links
  static const Color primaryDark    = Color(0xFF3730A3); // pressed state
  static const Color primaryLight   = Color(0xFF818CF8); // icons, highlights
  static const Color primarySurface = Color(0xFFEEF2FF); // card backgrounds
  static const Color primaryBorder  = Color(0xFFC7D2FE); // input borders (focused)

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Accent — Emerald (Money, Success)
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const Color success        = Color(0xFF059669); // paid, success
  static const Color successDark    = Color(0xFF047857);
  static const Color successLight   = Color(0xFF34D399);
  static const Color successSurface = Color(0xFFD1FAE5);

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Warning — Amber (due, warning)
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const Color warning        = Color(0xFFD97706);
  static const Color warningDark    = Color(0xFFB45309);
  static const Color warningLight   = Color(0xFFFBBF24);
  static const Color warningSurface = Color(0xFFFEF3C7);

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Danger — Red (error, due)
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const Color danger        = Color(0xFFDC2626);
  static const Color dangerDark    = Color(0xFFB91C1C);
  static const Color dangerLight   = Color(0xFFF87171);
  static const Color dangerSurface = Color(0xFFFEE2E2);

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Neutral — Warm Gray (text, background)
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const Color textPrimary   = Color(0xFF111827); // headings
  static const Color textSecondary = Color(0xFF6B7280); // labels, hints
  static const Color textTertiary  = Color(0xFF9CA3AF); // placeholders
  static const Color textDisabled  = Color(0xFFD1D5DB);
  static const Color textOnPrimary = Color(0xFFFFFFFF); // text on primary bg

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Background
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const Color bgBase       = Color(0xFFFFFFFF); // screen background
  static const Color bgSurface    = Color(0xFFF9FAFB); // cards, inputs
  static const Color bgElevated   = Color(0xFFF3F4F6); // chip, tag backgrounds
  static const Color bgSplash     = Color(0xFF4F46E5); // splash screen

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Border
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const Color borderDefault = Color(0xFFE5E7EB);
  static const Color borderFocused = Color(0xFF4F46E5);
  static const Color borderError   = Color(0xFFDC2626);

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Gradient
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end:   Alignment.bottomRight,
    colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end:   Alignment.bottomRight,
    colors: [Color(0xFF059669), Color(0xFF0D9488)],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end:   Alignment.bottomRight,
    colors: [Color(0xFFEEF2FF), Color(0xFFF5F3FF)],
  );
}