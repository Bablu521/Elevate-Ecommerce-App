import 'package:elevate_ecommerce_app/presentation/main_home/manager/controller_home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../../generated/l10n.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ControllerHomeProvider(),
      child: Consumer<ControllerHomeProvider>(
        builder: (context, value, child) => Scaffold(
          body: value.screens[value.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.h, color: AppColors.white[60]!),
              ),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
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
      ),
    );
  }
}
