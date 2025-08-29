import 'package:elevate_ecommerce_app/presentation/categories/view_models/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/custom_product_items.dart';

class CategoriesTabBarView extends StatelessWidget {
  final CategoriesViewModel categoriesViewModel;

  const CategoriesTabBarView({super.key, required this.categoriesViewModel});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 16.h),
      itemCount: categoriesViewModel.state.productsList!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 17,
        crossAxisSpacing: 17,
        childAspectRatio: 163 / 245,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            /*Navigator.of(context).pushNamed(
              RouteNames.productDetails,
              arguments: categoriesViewModel.state.productsList![index],
            );*/
          },
          child: CustomProductItems(
            title:
                categoriesViewModel.state.productsList![index].title ??
                "AppLocalizations.of(context).product",
            imgCover:
                categoriesViewModel.state.productsList![index].imgCover ??
                "AppImages.fakeImgUrl",
            priceAfterDiscount:
                categoriesViewModel
                    .state
                    .productsList![index]
                    .priceAfterDiscount ??
                0,
            price: categoriesViewModel.state.productsList![index].price ?? 0,
          ),
        );
      },
    );
  }
}
