import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/presentation/categories/views/screen/categories_page.dart';
import 'package:flutter/material.dart';

import '../../presentation/auth/login/views/login_view.dart';


abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RouteNames.categoriesPage:
        return MaterialPageRoute(builder: (_) => CategoriesPage(categoryId: "673c47751159920171827c93",));
      default:
        return MaterialPageRoute(builder: (_) => LoginView());
    }
  }
}
