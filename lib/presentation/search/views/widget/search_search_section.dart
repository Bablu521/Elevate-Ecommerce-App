import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../generated/l10n.dart';
import '../../view_models/search_events.dart';
import '../../view_models/search_view_model.dart';

class SearchSearchSection extends StatelessWidget {
  final SearchViewModel searchViewModel;

  const SearchSearchSection({super.key, required this.searchViewModel});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (_) {
        searchViewModel.doIntent(ProductsSearchEvent());
      },
      controller: searchViewModel.searchController,
      style: Theme.of(context).textTheme.bodySmall,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(
          width: 24.w,
          AppImages.searchIcon,
          colorFilter: ColorFilter.mode(AppColors.white[70]!, BlendMode.srcIn),
          fit: BoxFit.scaleDown,
        ),
        hintText: AppLocalizations.of(context).search,
        border: _searchFieldBorder,
        enabledBorder: _searchFieldBorder,
        focusedBorder: _searchFieldBorder,
        suffixIcon: IconButton(
          onPressed: () {
            searchViewModel.doIntent(ClearProductsSearchEvent());
          },
          icon: Icon(Icons.cancel_outlined, color: AppColors.white[70]),
        ),
      ),
    );
  }

  OutlineInputBorder get _searchFieldBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(color: AppColors.white[70]!, width: 1.w),
  );
}
