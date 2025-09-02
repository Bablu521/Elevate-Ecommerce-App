import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:flutter/material.dart';
import '../../presentation/auth/login/views/login_view.dart';
import '../../presentation/main_home/view/main_home.dart';


abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => MainHome());
      default:
        return MaterialPageRoute(builder: (_) => const LoginView());
    }
  }
}
