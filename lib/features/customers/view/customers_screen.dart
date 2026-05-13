import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_ledger/core/constants/app_colors.dart';
import 'package:shop_ledger/features/customers/widgets/search_customer.dart';
import 'package:shop_ledger/features/widgets/custom_app_bar.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/utils/date_formatter.dart';
import '../widgets/monthly_calender_widget.dart';
import '../widgets/total_due_widget.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "কাস্টমার তালিকা", onTap: (){}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchCustomer(),
            TotalDueWidgets(),
            SizedBox(height: 8,),
            Column(
              children: List.generate(10, (index) {
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primary.withOpacity(.2),
                    child: Text(
                      "ম",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("মাজিদ ভূঞা", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                Text("01735683137", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[600]),),
                                SizedBox(width: 4,),
                                CircleAvatar(radius: 3,),
                                SizedBox(width: 4,),
                                Text("রামপুরা", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[600]),)
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(30)
        
                              ),
                              child: Text("ঝুকিপূর্ন", style: TextStyle( fontWeight: FontWeight.w800, fontSize: 14, color: Color(0XFFE32A34)),
                              ))
                          ],
                        ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "৳ ২৫,০০০",
                        style: AppTextStyle.bodyMedium.copyWith(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w800,
                            fontSize: 16
                        ),
                      ),
                      SizedBox(height: 4,),
                      Text("বাকি", style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]
                      ),)
                    ]
                  ),
                ),
              );
            }),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text("বাকি ক্যালেন্ডার - ", style: AppTextStyle.bodyMedium.copyWith(fontSize: 14, fontWeight: FontWeight.w700)),
                  Text(
                    DateFormatter.toBanglaDate(DateTime.now()),
                    style: AppTextStyle.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppTextStyle.banglaFontFamily,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8,),
            MonthlyCalendarWidget(
              selectedDate: DateTime.now(),
            ),
        
        
          ],
        ),
      ),
    );
  }
}



