import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class TopProductList extends StatelessWidget {
  const TopProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: List.generate(
          5, // Corrected logic to handle the index for color variation
              (index) {
            Color avatarBgColor;
            Color textColor;

            switch (index) {
              case 0:
                avatarBgColor = Colors.amber.withOpacity(0.1);
                textColor = Colors.amber.shade800;
                break;
              case 1:
                avatarBgColor = Colors.blue.withOpacity(0.1);
                textColor = Colors.blue.shade800;
                break;
              case 2:
                avatarBgColor = Colors.orange.withOpacity(0.1);
                textColor = Colors.orange.shade800;
                break;
              default:
                avatarBgColor = AppColors.primary.withOpacity(0.1);
                textColor = AppColors.primary;
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: avatarBgColor,
                        child: Text("${index + 1}", style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("প্রোডাক্টের নাম", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                            Text("১২০ বার বিক্রি হয়েছে", style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      const Text("৳ ৫০০০ লাভ", style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
                if (index != 4) Divider(height: 1, color: Colors.grey.shade200, indent: 12, endIndent: 12),
              ],
            );
          },
        ),
      ),
    );
  }
}
