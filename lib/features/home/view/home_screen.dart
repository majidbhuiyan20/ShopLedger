import 'package:flutter/material.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/home_header.dart';
import '../widgets/stat_summary_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Top Header Section (Refactored) ────────────────────────
            const HomeHeader(),

            // ── Floating Content ───────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // ── Alert Banner ────────────────────────────────
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF9C4), 
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFFFE082)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 26),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "চাল ৫ কেজি মাত্র ৩টা বাকি আছে। এখনই অর্ডার করুন!",
                            style: AppTextStyle.bodyMedium.copyWith(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppTextStyle.banglaFontFamily,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                  
                  // ── Statistics Summary Card (Refactored) ───────────────
                  const StatSummaryCard(),
                  SizedBox(height: 16,),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                     color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      gradient:  LinearGradient(
                        colors: [
                          AppColors.primaryDark,
                          AppColors.primary.withOpacity(0.8),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],

                    ),
                    child: Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.2),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(15),

                            ),
                            child: Icon(Icons.sell_rounded, color: Colors.white, size: 26)),
                        SizedBox(width: 12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "নতুন বিক্রি শুরু করুন",
                              style: AppTextStyle.labelSmall.copyWith(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: AppTextStyle.banglaFontFamily,
                              ),
                            ),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                Text(
                                  "ইনভয়েস তৈরি",
                                  style: AppTextStyle.bodyMedium.copyWith(
                                    color: Colors.grey[300],
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppTextStyle.banglaFontFamily,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.circle, size: 6, color: Colors.white54),
                                const SizedBox(width: 4),
                                Text(
                                  "স্টক আপডেট",
                                  style: AppTextStyle.bodyMedium.copyWith(
                                    color: Colors.grey[300],
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppTextStyle.banglaFontFamily,
                                  ),
                                ),
                              ]
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Colors.white,size: 20,fontWeight: FontWeight.bold,)
                      ],
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
