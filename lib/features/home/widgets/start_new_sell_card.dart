import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_style.dart';
class StartNewSellCard extends StatelessWidget {
  const StartNewSellCard({
    super.key,required this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}