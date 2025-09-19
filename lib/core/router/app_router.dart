import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/presentation/auth/forget_password/views/screen/forget_password_screen.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/views/screen/register_view.dart';
import 'package:elevate_ecommerce_app/presentation/best_seller/view/screen/best_seller_view.dart';
import 'package:elevate_ecommerce_app/presentation/cart/views/screen/cart_page.dart';
import 'package:elevate_ecommerce_app/presentation/notifications/view/notifications_view.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/views/screen/occasion_view.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/view/screen/product_details_view.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/change_password_view.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/edit_profile_view.dart';
import 'package:elevate_ecommerce_app/presentation/search/views/screen/search_screen.dart';
import 'package:flutter/material.dart';
import '../../presentation/address/views/screens/saved_address_view.dart';
import '../../presentation/address/views/screens/add_address_view.dart';
import '../../presentation/auth/login/views/login_view.dart';
import '../../presentation/checkout/views/screen/checkout_screen.dart';
import '../../presentation/main_home/view/main_home.dart';
import '../../presentation/order_page/views/orders_page.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const MainHome());
      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case RouteNames.cart:
        return MaterialPageRoute(
          builder: (_) => const CartPage(),
          settings: settings,
        );
      case RouteNames.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordView());
      case RouteNames.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileView());
      case RouteNames.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case RouteNames.occasion:
        return MaterialPageRoute(
          builder: (_) => const OccasionView(),
          settings: settings,
        );
      case RouteNames.bestSeller:
        return MaterialPageRoute(builder: (_) => const BestSellerView());
      case RouteNames.savedAddress:
        return MaterialPageRoute(
          builder: (_) => const SavedAddressView(),
          settings: settings,
        );
      case RouteNames.addAddress:
        return MaterialPageRoute(
          builder: (_) => AddAddressView(),
          settings: settings,
        );
      case RouteNames.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsView());
      case RouteNames.productDetails:
        final ProductEntity productEntity = settings.arguments as ProductEntity;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsView(productEntity: productEntity),
        );
      case RouteNames.checkOut:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case RouteNames.ordersPage:
        return MaterialPageRoute(builder: (_) => const OrdersPage());
      case RouteNames.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginView());
    }
  }
}
