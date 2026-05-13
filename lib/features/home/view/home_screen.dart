import 'package:flutter/material.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/section_header.dart';
import '../widgets/home_header.dart';
import '../widgets/start_new_sell_card.dart';
import '../widgets/stat_summary_card.dart';
import '../../widgets/common_widgets.dart';

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
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.orange,
                          size: 26,
                        ),
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
                  SizedBox(height: 16),

                  // ── Start New Sell Card (Refactored) ───────────────
                  StartNewSellCard(onTap: () {}),
                  SizedBox(height: 8),
                  SectionHeader(title: "সাম্প্রতিক বিক্রি", onActionTap: () {}),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: List.generate(3, (index) {
                        return Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundColor: AppColors.primary.withOpacity(
                                  0.1,
                                ),
                                child: const Icon(
                                  Icons.shopping_bag_outlined,
                                  color: AppColors.primary,
                                ),
                              ),
                              title: Text(
                                "রহিম মিয়া",
                                style: AppTextStyle.bodyMedium.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  fontFamily: AppTextStyle.banglaFontFamily,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    "বড় বাড়ি, বানাইল",
                                    style: AppTextStyle.bodyMedium.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "৳ 540.00",
                                    style: AppTextStyle.bodyMedium.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                  Text(
                                    "বাকি",
                                    style: AppTextStyle.bodyMedium.copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (index !=
                                2) // Don't show divider for the last item
                              const Divider(
                                height: 1,
                                color: Color(0xFFEEEEEE),
                              ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
