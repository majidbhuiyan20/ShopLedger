import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_style.dart';

class MonthlyGoalCard extends StatelessWidget {
  const MonthlyGoalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "মাসিক লক্ষ্যমাত্রা",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          Text(
            "৳ ৮০,০০০",
            style: AppTextStyle.bodyMedium.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 22
            ),
          ),

          RichText(
            text: TextSpan(
              style: AppTextStyle.bodyMedium.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
              children: [
                TextSpan(
                  text: "৳ ৪৮,০০০ ",
                  style:  TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
                ),
                TextSpan(text: "পৌঁছেছি ", style: TextStyle(color: Colors.white.withOpacity(.9), fontSize: 16)),
              ],
            ),
          ),
          SizedBox(height: 12),
          Stack(
            children: [
              Container(
                height: 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.6, // 60% progress
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text("60% সম্পন্ন",overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
              Spacer(),
              Text("বাকি ১৫ দিন", overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w500),),
              SizedBox(width: 4,),
              CircleAvatar(radius: 4, backgroundColor: Colors.white,),
              SizedBox(width: 4,),
              Text("প্রতিদিন ১৪০০ টাকা করে দরকার", overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w500),),

            ],
          )
        ],
      ),
    );
  }
}