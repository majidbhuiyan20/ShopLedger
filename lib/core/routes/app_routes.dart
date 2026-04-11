import 'package:flutter/material.dart';
import 'package:shop_ledger/core/constants/app_strings.dart';
import 'package:shop_ledger/features/auth/presentation/screens/login_screen.dart';
import 'package:shop_ledger/features/auth/presentation/screens/register_screen.dart';
import 'package:shop_ledger/features/auth/presentation/screens/otp_screen.dart';
import '../../features/splash/splash_screen.dart';

class Routes{
  static const String splashRoute="/";
  static const String loginRoute="/loginScreen";
  static const String registerRoute="/RegisterScreen";
  static const String otpRoute="/OtpScreen";

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
        final email = routeSettings.arguments as String? ?? 'your email';
        return MaterialPageRoute(builder: (_)=> OtpScreen(email: email));

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