import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../generated/l10n.dart';
import '../../view_models/categories_events.dart';
import '../../view_models/categories_view_model.dart';

class CategoriesSearchSection extends StatelessWidget {
  final CategoriesViewModel categoriesViewModel;

  const CategoriesSearchSection({super.key, required this.categoriesViewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        spacing: 8.w,
        children: [
          Expanded(
            flex: 4,
            child: TextFormField(
              controller: categoriesViewModel.searchController,
              style: Theme.of(context).textTheme.bodySmall,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: AppColors.white[70]),
                hintText: AppLocalizations.of(context).search,
                border: searchOutlineInputBorder(),
                focusedBorder: searchOutlineInputBorder(),
                enabledBorder: searchOutlineInputBorder(),
              ),
              onChanged: (_) {
                categoriesViewModel.doIntent(ProductsSearchEvent());
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                minimumSize: WidgetStateProperty.all(
                  Size(double.infinity, 48.h),
                ),
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                backgroundColor: WidgetStateProperty.all(AppColors.white),
                iconColor: WidgetStateProperty.all(AppColors.white[70]),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                side: WidgetStateProperty.all(
                  BorderSide(color: AppColors.white[70]!, width: 1.w),
                ),
              ),
              label: SvgPicture.asset(AppImages.filterIcon),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder searchOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(color: AppColors.white[70]!, width: 1.w),
    );
  }
}
