import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/views/screen/register_view.dart';

import 'package:flutter/material.dart';

import '../../presentation/auth/login/views/login_view.dart';
import '../../presentation/home/pages/home.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => LoginView());
        case RouteNames.home:
        return MaterialPageRoute(builder: (_) => Home());

      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => RegisterView());

      default:
        return MaterialPageRoute(builder: (_) => LoginView());
    }
  }
}
