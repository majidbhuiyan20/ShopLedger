import 'package:flutter/material.dart';

import '../../../core/constants/app_text_style.dart';

class TotalDueWidgets extends StatelessWidget {
  const TotalDueWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "মোট বাকি",
                  style: AppTextStyle.bodyMedium.copyWith(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "৳ ২৫,০০০",
                  style: AppTextStyle.bodyMedium.copyWith(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w800,
                      fontSize: 22
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "৮ জন কাস্টমারের কাছে",
                  style: AppTextStyle.bodySmall.copyWith(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.redAccent,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}