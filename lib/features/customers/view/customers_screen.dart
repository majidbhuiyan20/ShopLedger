import 'package:flutter/material.dart';
import '../../../core/constants/app_text_style.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "কাস্টমার",
          style: AppTextStyle.h2,
        ),
      ),
    );
  }
}
