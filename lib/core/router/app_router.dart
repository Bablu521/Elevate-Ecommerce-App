import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/views/screen/register_view.dart';
import 'package:elevate_ecommerce_app/presentation/best_seller/view/best_seller_view.dart';
import 'package:elevate_ecommerce_app/presentation/main_home/pages/home.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/screen/product_details_view.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/views/screen/occasion_view.dart';

import 'package:flutter/material.dart';

import '../../presentation/auth/forget_password/views/screen/forget_password_screen.dart';
import '../../presentation/auth/login/views/screen/login_view.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteNames.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => Home());
      case RouteNames.productDetails:
        final ProductEntity productEntity = settings.arguments as ProductEntity;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsView(productEntity: productEntity),
        );
      case RouteNames.occasion:
        final occasionId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => OccasionView(occasionId: occasionId),
        );
      case RouteNames.bestSeller:
        final List<ProductEntity> listProduct =
            settings.arguments as List<ProductEntity>;
        return MaterialPageRoute(
          builder: (_) => BestSellerView(listProduct: listProduct),
        );
      default:
        return MaterialPageRoute(builder: (_) => const LoginView());
    }
  }
}
