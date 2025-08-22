import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_cubit.dart';
import 'package:flutter/material.dart';

import '../../presentation/auth/login/views/login_view.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
          builder:
              (_) => const LoginView(),
        );

      default:
        return MaterialPageRoute(builder: (_) => const LoginView());
    }
  }
}
