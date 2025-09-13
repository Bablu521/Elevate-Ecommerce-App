import 'package:elevate_ecommerce_app/presentation/categories/view_models/categories_events.dart';
import 'package:elevate_ecommerce_app/presentation/categories/view_models/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/widgets/custom_product_items.dart';

class CategoriesTabBarView extends StatelessWidget {
  final CategoriesViewModel categoriesViewModel;
  final CategoriesState state;
  const CategoriesTabBarView({
    super.key,
    required this.categoriesViewModel,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 16.h),
      itemCount: categoriesViewModel.state.productsList!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 17,
        crossAxisSpacing: 17,
        childAspectRatio: 160 / 260,
      ),
      itemBuilder: (context, index) {
        final product = state.productsList![index];
        final productId = product.id ?? "";
        final cartState = state.cartStates[productId];
        return CustomProductItems(
          productEntity: categoriesViewModel.state.productsList![index],
          cartState: cartState,
          onPressedButton: () {
            categoriesViewModel.doIntent(
              CategoriesAddToCartEvent(productId: productId),
            );
          },
        );
      },
    );
  }
}
