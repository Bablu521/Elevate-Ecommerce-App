import 'package:elevate_ecommerce_app/presentation/main_home/main_provider/controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ControllerProvider(),
      child: Consumer<ControllerProvider>(
        builder:
            (context, value, child) => Scaffold(
              body: value.screens[value.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: value.currentIndex,
                onTap: value.changePage,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home_outlined),
                    label: AppLocalizations.of(context).home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.category_outlined),
                    label: AppLocalizations.of(context).categories,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    label: AppLocalizations.of(context).cart,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person_outline_outlined),
                    label: AppLocalizations.of(context).profile,
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
