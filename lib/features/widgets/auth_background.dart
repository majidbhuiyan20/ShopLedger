import 'package:flutter/material.dart';
import 'dart:math';
import '../../core/constants/app_colors.dart';

/// Light Business Auth Background
class AuthBackground extends StatefulWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  State<AuthBackground> createState() => _AuthBackgroundState();
}

class _AuthBackgroundState extends State<AuthBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: LightBusinessPainter(animationValue: _controller.value),
              size: MediaQuery.of(context).size,
            );
          },
        ),
        widget.child,
      ],
    );
  }
}

class LightBusinessPainter extends CustomPainter {
  final double animationValue;

  LightBusinessPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    // Sales mini chart (bottom right)
    final salesPaint = Paint()
      ..color = AppColors.primary.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 6; i++) {
      final height = 20 + sin(animationValue * 2 * pi + i) * 15;
      final x = size.width - 80 + i * 10;
      final y = size.height - 40 - height;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, 6, height),
          const Radius.circular(3),
        ),
        salesPaint,
      );
    }

    // Due indicator (bottom left)
    final duePaint = Paint()
      ..color = AppColors.primary.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawArc(
      Rect.fromLTWH(20, size.height - 70, 50, 50),
      -pi / 2,
      2 * pi * (0.3 + sin(animationValue * pi) * 0.1),
      false,
      duePaint,
    );

    // Stock level bars (top right)
    for (int i = 0; i < 4; i++) {
      final level = 0.4 + sin(animationValue * 3 * pi + i) * 0.3;
      final barPaint = Paint()
        ..color = (level > 0.6 ? Colors.green : Colors.orange).withOpacity(0.3)
        ..style = PaintingStyle.fill;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(size.width - 60 + i * 12, 30, 6, 40 * level),
          const Radius.circular(3),
        ),
        barPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant LightBusinessPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}