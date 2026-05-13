import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_style.dart';
class RecentSellHomeHistory extends StatelessWidget {
  const RecentSellHomeHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
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
    );
  }
}