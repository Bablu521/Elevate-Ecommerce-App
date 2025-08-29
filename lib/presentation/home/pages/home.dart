import 'package:elevate_ecommerce_app/presentation/categories/views/screen/categories_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../cart/views/cart.dart';
import '../../profile/views/profile_view.dart';
import '../views/home_screen_view.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    CategoriesPage(categoryId: "673c46fd1159920171827c85"),
    Cart(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {});
          currentIndex = index;
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: AppLocalizations.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: AppLocalizations.of(context).categories,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: AppLocalizations.of(context).cart,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: AppLocalizations.of(context).profile,
          ),
        ],
      ),
    );
  }
}
