import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/views/screen/occasion_view.dart';
import 'package:flutter/material.dart';

import '../../presentation/auth/login/views/login_view.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => LoginView());

      case RouteNames.occasion:
        return MaterialPageRoute(
          builder: (_) => OccasionView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(builder: (_) => LoginView());
    }
  }
}
