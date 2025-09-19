import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/router/route_names.dart';
import '../../../../generated/l10n.dart';
import '../../view_models/categories_view_model.dart';
import 'categories_filter_bottom_sheet.dart';

class CategoriesSearchSection extends StatelessWidget {
  final CategoriesViewModel categoriesViewModel;

  const CategoriesSearchSection({super.key, required this.categoriesViewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        child: Row(
          spacing: 8.w,
          children: [
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.search);
                },
                child: TextFormField(
                  enabled: false,
                  style: Theme.of(context).textTheme.bodySmall,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: AppColors.white[70]),
                    hintText: AppLocalizations.of(context).search,
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.white[70]!,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  if (categoriesViewModel.selectedTabIndex.value == 0) {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return CategoriesFilterBottomSheet(
                          categoriesViewModel: categoriesViewModel,
                        );
                      },
                    );
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    enabled: false,
                    contentPadding: EdgeInsets.zero,
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.white[70]!,
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.filterIcon,
                      color: AppColors.white[70],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
