import 'package:elevate_ecommerce_app/presentation/categories/view_models/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/const_keys.dart';
import '../../../../core/enums/product_sort_enum.dart';
import '../../../../generated/l10n.dart';
import '../../view_models/categories_events.dart';

class CategoriesFilterBottomSheet extends StatelessWidget {
  final CategoriesViewModel categoriesViewModel;

  const CategoriesFilterBottomSheet({
    super.key,
    required this.categoriesViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 80.w,
              child: Divider(
                color: AppColors.darkGray,
                thickness: 4.h,
                radius: BorderRadius.circular(100.r),
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context).sortBy,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontFamily: ConstKeys.outfitFont,
              color: AppColors.mainColor,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 16.h),
          ValueListenableBuilder(
            valueListenable: categoriesViewModel.selectedFilterIndex,
            builder: (context, value, child) {
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ProductSortEnum.values.length,
                itemBuilder: (context, index) {
                  return buildRadioListTile(
                    context: context,
                    index: ProductSortEnum.values[index],
                    value: value,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 16.h);
                },
              );
            },
          ),
          SizedBox(height: 16.h),
          ElevatedButton.icon(
            onPressed: () {
              categoriesViewModel.doIntent(ProductsSortEvent());
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(AppImages.bottomFilterIcon),
            label: Text(
              AppLocalizations.of(context).filter,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(),
          ),
        ],
      ),
    );
  }

  Widget buildRadioListTile({
    required BuildContext context,
    required ProductSortEnum index,
    required ProductSortEnum? value,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 16.w, right: 10.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: RadioListTile(
        value: index,
        groupValue: value,
        onChanged: (val) {
          categoriesViewModel.doIntent(ChangeSelectedFilterEvent(sort: val));
        },
        title: Text(
          index.displayName,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        dense: true,
        controlAffinity: ListTileControlAffinity.trailing,
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
