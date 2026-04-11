import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Investment Property list",
          style: TextStyle(
            fontSize: 45,
            fontFamily: "PlusJakartaSans",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
