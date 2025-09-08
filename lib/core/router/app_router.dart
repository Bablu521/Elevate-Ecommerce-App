import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/presentation/address/views/screens/add_address_view.dart';
import 'package:elevate_ecommerce_app/presentation/address/views/screens/saved_address_view.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/views/screen/register_view.dart';

import 'package:flutter/material.dart';
import '../../presentation/auth/login/views/login_view.dart';

import '../../presentation/main_home/view/main_home.dart';


abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const MainHome());
      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case RouteNames.savedAddress:
        return MaterialPageRoute(builder: (_) => const SavedAddressView(),settings: settings);
      case RouteNames.addAddress:
        return MaterialPageRoute(builder: (_) => const AddAddressView(),settings: settings);

      default:
        return MaterialPageRoute(builder: (_) => const LoginView());
    }
  }
}
