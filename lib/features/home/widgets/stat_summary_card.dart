import 'package:flutter/material.dart';
import '../../../core/constants/app_text_style.dart';

class StatSummaryCard extends StatelessWidget {
  const StatSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
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
          _buildStatItem("আজ বিক্রি", "১৫,২০০৳", const Color(0xFF66BB6A)),
          _buildVerticalDivider(),
          _buildStatItem("Invoice", "৮ টি", const Color(0xFFFFA726)),
          _buildVerticalDivider(),
          _buildStatItem("নতুন বাকি", "৫০০৳", const Color(0xFFEF5350)),
          _buildVerticalDivider(),
          _buildStatItem("লাভ", "৩,৮০০৳", const Color(0xFFEC407A)),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: AppTextStyle.labelSmall.copyWith(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                  fontFamily: AppTextStyle.banglaFontFamily,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: AppTextStyle.h4.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.black,
              fontSize: 15,
              fontFamily: AppTextStyle.banglaFontFamily,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 35,
      width: 1.2,
      color: Colors.grey.withOpacity(0.15),
    );
  }
}
