import 'package:flutter/material.dart';
import '../../../core/constants/app_text_style.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "রিপোর্ট",
          style: AppTextStyle.h2,
        ),
      ),
    );
  }
}
