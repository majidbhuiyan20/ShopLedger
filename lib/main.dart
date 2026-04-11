import 'package:flutter/material.dart';
import 'package:shop_ledger/core/constants/app_theme.dart';
import 'package:shop_ledger/features/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: SplashScreen(),
    );
  }
}

