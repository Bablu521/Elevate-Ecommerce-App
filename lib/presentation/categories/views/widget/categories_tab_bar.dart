import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../view_models/categories_view_model.dart';

class CategoriesTabBar extends StatelessWidget {
  final CategoriesViewModel categoriesViewModel;

  const CategoriesTabBar({super.key, required this.categoriesViewModel});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: categoriesViewModel.tabController,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      dividerHeight: 0,
      dividerColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      indicatorPadding: EdgeInsets.zero,
      tabs: [
        buildTab(
          context: context,
          category: AppLocalizations.of(context).all,
          index: 0,
          isSelected: categoriesViewModel.selectedTabIndex.value == 0,
        ),
        ...categoriesViewModel.state.categoriesList!.asMap().entries.map((
          entry,
        ) {
          final index = entry.key + 1;
          final category = entry.value;
          return buildTab(
            context: context,
            category: category.name!,
            index: index,
            isSelected: categoriesViewModel.selectedTabIndex.value == index,
          );
        }),
      ],
    );
  }

  Widget buildTab({
    required BuildContext context,
    required String category,
    required int index,
    required bool isSelected,
  }) {
    return IntrinsicWidth(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 6.h,
        children: [
          Text(
            category,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: isSelected ? AppColors.mainColor : AppColors.white[70],
            ),
            maxLines: 1,
          ),
          Divider(
            radius:const BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            height: 3.w,
            thickness: 3.w,
            color: isSelected ? AppColors.mainColor : AppColors.white[70],
          ),
        ],
      ),
    );
  }
}
