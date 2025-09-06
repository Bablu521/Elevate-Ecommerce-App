import 'package:elevate_ecommerce_app/presentation/cart/views/cart_page.dart';
import 'package:elevate_ecommerce_app/presentation/home/views/home_page.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/profile_page.dart';
import 'package:flutter/material.dart';

import '../../categories/views/screen/categories_page.dart';

class ControllerHomeProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> get screens => [
    const HomePage(),
    const CategoriesPage(),
    const CartPage(),
    const ProfilePage(),
  ];
  void changePage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
