import 'package:elevate_ecommerce_app/presentation/cart/views/cart.dart';
import 'package:elevate_ecommerce_app/presentation/categories/views/screen/categories_page.dart';
import 'package:elevate_ecommerce_app/presentation/home_screen/views/home_screen_view.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

class ControllerProvider extends ChangeNotifier {
  int currentIndex = 0;
  String categoryId = '';
  List<Widget> get screens => [
    HomeScreen(),
    CategoriesPage(categoryId: categoryId),
    Cart(),
    Profile(),
  ];
  void changePage(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void changeSelectedCategory(String id) {
    categoryId = id;
    
  }
}
