import 'package:elevate_ecommerce_app/presentation/categories/views/widget/categories_search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../generated/l10n.dart';
import '../../view_models/categories_view_model.dart';
import 'categories_filter_bottom_sheet.dart';
import 'categories_tab_bar.dart';
import 'categories_tab_bar_view.dart';

class CategoriesViewBody extends StatelessWidget {
  final CategoriesViewModel categoriesViewModel;

  const CategoriesViewBody({super.key, required this.categoriesViewModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          spacing: 16.h,
          children: [
            SizedBox(height: 16.h),
            CategoriesSearchSection(categoriesViewModel: categoriesViewModel),
            ValueListenableBuilder(
              valueListenable: categoriesViewModel.selectedTabIndex,
              builder: (BuildContext context, selectedIndex, Widget? child) {
                return CategoriesTabBar(
                  categoriesViewModel: categoriesViewModel,
                );
              },
            ),
            Expanded(
              child: Builder(
                builder: (_) {
                  if (categoriesViewModel.state.isProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (categoriesViewModel.productsList == null ||
                      categoriesViewModel.productsList?.isEmpty == true) {
                    return Center(
                      child: Text(
                        AppLocalizations.of(context).noProductsAvailable,
                      ),
                    );
                  }
                  return TabBarView(
                    controller: categoriesViewModel.tabController,
                    children: [
                      CategoriesTabBarView(
                        categoriesViewModel: categoriesViewModel,
                        state: categoriesViewModel.state,
                      ),
                      ...?categoriesViewModel.state.categoriesList?.map(
                        (_) => CategoriesTabBarView(
                          categoriesViewModel: categoriesViewModel,
                          state: categoriesViewModel.state,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        if (categoriesViewModel.selectedTabIndex.value == 0)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return CategoriesFilterBottomSheet(
                        categoriesViewModel: categoriesViewModel,
                      );
                    },
                  );
                },
                icon: SvgPicture.asset(AppImages.bottomFilterIcon),
                label: Text(
                  AppLocalizations.of(context).filter,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(),
              ),
            ),
          ),
      ],
    );
  }
}
