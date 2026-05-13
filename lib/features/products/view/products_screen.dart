import 'package:flutter/material.dart';
import '../../../core/constants/app_text_style.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "পণ্য তালিকা",
          style: AppTextStyle.h2,
        ),
      ),
    );
  }
}
