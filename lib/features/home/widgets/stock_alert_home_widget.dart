import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_style.dart';
class StockAlertHomeWidget extends StatelessWidget {
  const StockAlertHomeWidget({
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
                    color: AppColors.warningLight.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.warningLight,
                  ),
                ),
                title: Text(
                  "চাল ৫ কেজি",
                  style: AppTextStyle.bodyMedium.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    fontFamily: AppTextStyle.banglaFontFamily,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const LinearProgressIndicator(
                      value: 0.3, // Example value
                      backgroundColor: Color(0xFFEEEEEE),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      minHeight: 6,
                    ),
                  ),
                ),
                trailing:
                    Text(
                      "২টি",
                      style: AppTextStyle.bodyMedium.copyWith(
                        color: AppColors.warningLight,
                        fontWeight: FontWeight.bold,

                      ),
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