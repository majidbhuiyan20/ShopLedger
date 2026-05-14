import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shop_ledger/core/constants/app_colors.dart';
import 'package:shop_ledger/features/widgets/custom_app_bar.dart';
import '../../../core/constants/app_text_style.dart';
import '../widgets/filter_card_widgets.dart';
import '../widgets/monthly_goal_card.dart';
import '../widgets/top_product_list.dart';
import '../widgets/total_sell_history.dart';
import '../widgets/weekly_sell_widgets.dart';

final selectedFilterProvider = StateProvider<String>((ref) => "আজ");

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final monthNames = {
      1: "জানুয়ারি",
      2: "ফেব্রুয়ারি",
      3: "মার্চ",
      4: "এপ্রিল",
      5: "মে",
      6: "জুন",
      7: "জুলাই",
      8: "আগস্ট",
      9: "সেপ্টেম্বর",
      10: "অক্টোবর",
      11: "নভেম্বর",
      12: "ডিসেম্বর",
    };
    final currentMonth = monthNames[now.month];
    final filters = ["আজ", "এই সপ্তাহ", "এই মাস", "এই বছর", "কাস্টম"];
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: CustomAppBar(
        appBarTitle: "রিপোর্ট ও বিশ্লেষণ",
        onTap: () {},
        icon: Icons.file_download_outlined,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Consumer(
                builder: (context, ref, _) {
                  final selected = ref.watch(selectedFilterProvider);
          
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: filters.map((item) {
                        return Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: FilterChipWidget(
                            title: item,
                            isSelected: selected == item,
                            icon: item == "কাস্টম"
                                ? Icon(
                                    Icons.calendar_month_outlined,
                                    size: 18,
                                    color: selected == item
                                        ? Colors.white
                                        : AppColors.primary,
                                  )
                                : null,
                            onTap: () {
                              ref.read(selectedFilterProvider.notifier).state =
                                  item;
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              MonthlyGoalCard(),
              SizedBox(height: 16),
              TotalSellHistory(currentMonth: currentMonth),
              SizedBox(height: 16),
              Text("সাপ্তাহিক বিক্রি", style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black
              ),),
              const SizedBox(height: 16),
              WeeklySellWidgets(),
              SizedBox(height: 16,),
              Text("সেরা প্রোডাক্ট", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black
              ),),
              const SizedBox(height: 16,),
              TopProductList(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}




