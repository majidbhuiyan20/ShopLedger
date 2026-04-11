import 'package:flutter/material.dart';
import 'dart:math';
import '../../core/constants/app_colors.dart';

/// Beautiful animated Auth Background with custom paint
class AuthBackground extends StatefulWidget {
  final Widget child;
  final bool showPattern;

  const AuthBackground({
    super.key,
    required this.child,
    this.showPattern = true,
  });

  @override
  State<AuthBackground> createState() => _AuthBackgroundState();
}

class _AuthBackgroundState extends State<AuthBackground>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _floatingController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _floatingController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // ── Base Gradient ──────────────────────────────────────
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.bgBase,
                AppColors.bgBase.withOpacity(0.98),
                AppColors.bgBase,
              ],
            ),
          ),
        ),

        // ── Animated Background Painter ───────────────────────
        if (widget.showPattern)
          AnimatedBuilder(
            animation: Listenable.merge([
              _animationController,
              _floatingController,
            ]),
            builder: (context, child) {
              return CustomPaint(
                painter: AuthBackgroundPainter(
                  animationValue: _animationController.value,
                  floatingValue: _floatingController.value,
                  size: size,
                ),
                child: Container(),
              );
            },
          ),

        // ── Child Content ────────────────────────────────────
        widget.child,
      ],
    );
  }
}

/// Custom painter for animated background
class AuthBackgroundPainter extends CustomPainter {
  final double animationValue;
  final double floatingValue;
  final Size size;

  AuthBackgroundPainter({
    required this.animationValue,
    required this.floatingValue,
    required this.size,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // ── Animated Gradient Circle 1 (Top-left) ─────────────────
    final circle1Offset = Offset(
      -100 + (animationValue * 40),
      -100 + (sin(floatingValue * 2 * 3.14159) * 20),
    );
    
    paint.shader = RadialGradient(
      colors: [
        AppColors.primary.withOpacity(0.2),
        AppColors.primary.withOpacity(0.05),
        AppColors.primary.withOpacity(0),
      ],
    ).createShader(Rect.fromCircle(center: circle1Offset, radius: 150));
    
    canvas.drawCircle(circle1Offset, 150, paint);

    // ── Animated Gradient Circle 2 (Bottom-right) ──────────────
    final circle2Offset = Offset(
      size.width + 80 - (animationValue * 40),
      size.height + 100 + (sin(floatingValue * 2 * 3.14159) * 20),
    );
    
    paint.shader = RadialGradient(
      colors: [
        AppColors.primary.withOpacity(0.15),
        AppColors.primary.withOpacity(0.03),
        AppColors.primary.withOpacity(0),
      ],
    ).createShader(Rect.fromCircle(center: circle2Offset, radius: 140));
    
    canvas.drawCircle(circle2Offset, 140, paint);

    // ── Animated Accent Line (Center) ────────────────────────
    final linePaint = Paint()
      ..strokeWidth = 2
      ..shader = LinearGradient(
        colors: [
          AppColors.primary.withOpacity(0),
          AppColors.primary.withOpacity(0.25),
          AppColors.primary.withOpacity(0),
        ],
      ).createShader(Rect.fromLTWH(0, size.height * 0.35, size.width, 2));

    final lineYOffset = (sin(floatingValue * 2 * 3.14159) * 30);
    canvas.drawLine(
      Offset(-50, size.height * 0.35 + lineYOffset),
      Offset(size.width + 50, size.height * 0.35 + lineYOffset),
      linePaint,
    );

    // ── Floating Dots Pattern ──────────────────────────────────
    _drawFloatingDots(canvas, size);
  }

  void _drawFloatingDots(Canvas canvas, Size size) {
    final dotPaint = Paint();
    const dotCount = 12;
    const dotRadius = 3.0;

    for (int i = 0; i < dotCount; i++) {
      final angle = (i / dotCount) * 2 * 3.14159;
      final distance = 180 + (sin(floatingValue * 2 * 3.14159 + angle) * 40);

      final x = size.width / 2 + distance * cos(angle);
      final y = size.height * 0.4 + distance * sin(angle);

      final opacity = 0.1 + (sin(floatingValue * 2 * 3.14159 + angle) * 0.1);
      dotPaint.color = AppColors.primary.withOpacity(opacity);

      canvas.drawCircle(Offset(x, y), dotRadius, dotPaint);
    }
  }

  @override
  bool shouldRepaint(AuthBackgroundPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue ||
      oldDelegate.floatingValue != floatingValue;
}
