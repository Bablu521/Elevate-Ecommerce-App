import 'package:elevate_ecommerce_app/presentation/cart/views/screen/cart_page.dart';
import 'package:elevate_ecommerce_app/presentation/home/views/home_page_view.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/profile_page.dart';
import 'package:flutter/material.dart';

import '../../categories/views/screen/categories_page.dart';

class ControllerHomeProvider extends ChangeNotifier {
  int currentIndex = 0;
  String? selectedCategoryId;

  List<Widget> get screens => [
    const HomeScreen(),
    CategoriesPage(categoryId: selectedCategoryId),
    const CartPage(),
    const ProfilePage(),
  ];

  void changePage(int index) {
    selectedCategoryId = null;
    currentIndex = index;
    notifyListeners();
  }

  void openCategory(String? categoryId) {
    selectedCategoryId = categoryId;
    currentIndex = 1;
    notifyListeners();
  }
}
