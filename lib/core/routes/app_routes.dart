import 'package:flutter/material.dart';
import 'package:shop_ledger/core/constants/app_strings.dart';
import 'package:shop_ledger/features/auth/presentation/screens/login_screen.dart';
import '../../features/splash/splash_screen.dart';

class Routes{
  static const String splashRoute="/";
  static const String loginRoute="/loginScreen";

}
class RouteGenerator{
  static Route<dynamic>getRoute(RouteSettings routeSettings){
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=> LoginScreen());


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