import 'package:flutter/material.dart';
import 'package:shop_ledger/core/constants/app_strings.dart';
import '../../features/auth/presentation/view/forget_password_screen.dart';
import '../../features/auth/presentation/view/login_screen.dart';
import '../../features/auth/presentation/view/otp_screen.dart';
import '../../features/auth/presentation/view/register_screen.dart';
import '../../features/auth/presentation/view/reset_password_screen.dart';
import '../../features/splash/splash_screen.dart';

class Routes{
  static const String splashRoute="/";
  static const String loginRoute="/loginScreen";
  static const String registerRoute="/RegisterScreen";
  static const String otpRoute="/OtpScreen";
  static const String forgotPasswordRoute="/ForgotPasswordScreen";
  static const String resetPasswordRoute="/ResetPasswordScreen";
}

class RouteGenerator{
  static Route<dynamic>getRoute(RouteSettings routeSettings){
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=> LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_)=> RegisterScreen());
      case Routes.otpRoute:
        final arguments = routeSettings.arguments as Map<String, dynamic>? ?? {};
        final email = arguments['email'] as String? ?? 'your email';
        final isPasswordReset = arguments['isPasswordReset'] as bool? ?? false;
        return MaterialPageRoute(
          builder: (_)=> OtpScreen(
            email: email,
            isPasswordReset: isPasswordReset,
          ),
        );
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_)=> ForgotPasswordScreen());
      case Routes.resetPasswordRoute:
        final arguments = routeSettings.arguments as Map<String, dynamic>? ?? {};
        final email = arguments['email'] as String? ?? '';
        final otp = arguments['otp'] as String? ?? '';
        return MaterialPageRoute(
          builder: (_)=> ResetPasswordScreen(
            email: email,
            otp: otp,
          ),
        );

      default:
        return unDefineRoute();
    }

  }
  static Route<dynamic>unDefineRoute(){
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(title: Text(AppStrings.noRoute),),
      body: Center(child: Text(AppStrings.noRoute),),
    ));
  }
}