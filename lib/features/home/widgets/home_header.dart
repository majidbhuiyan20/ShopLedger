import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
          decoration: const BoxDecoration(
            color: AppColors.primary,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "আপনার দোকান",
                        style: AppTextStyle.bodySmall.copyWith(
                          color: Colors.white.withOpacity(0.85),
                          fontWeight: FontWeight.w500,
                          fontFamily: AppTextStyle.banglaFontFamily,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "মেসার্স রহিম স্টোর",
                        style: AppTextStyle.h2.copyWith(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppTextStyle.banglaFontFamily,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _buildHeaderAction(Icons.notifications_none_rounded, hasBadge: true),
                      const SizedBox(width: 12),
                      _buildHeaderAction(Icons.person_outline_rounded),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 28),
              // Business Status Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "শনিবার, ১৫ মার্চ ২০২৫",
                      style: AppTextStyle.bodySmall.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontFamily: AppTextStyle.banglaFontFamily,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          "আজকের ব্যবসা ভালো চলছে!",
                          style: AppTextStyle.h3.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTextStyle.banglaFontFamily,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text("💪", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Decorative Circles
        Positioned(
          right: -80,
          top: -30,
          child: CircleAvatar(radius: 100, backgroundColor: Colors.white.withOpacity(0.1)),
        ),
      ],
    );
  }

  Widget _buildHeaderAction(IconData icon, {bool hasBadge = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(icon, color: Colors.white, size: 26),
          if (hasBadge)
            const Positioned(
              right: 1,
              top: 1,
              child: CircleAvatar(
                radius: 4.5,
                backgroundColor: Color(0xFFFF4081),
                child: CircleAvatar(radius: 2, backgroundColor: Colors.white),
              ),
            )
        ],
      ),
    );
  }
}
