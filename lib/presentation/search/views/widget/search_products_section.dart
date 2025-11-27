import 'package:elevate_ecommerce_app/presentation/search/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/custom_product_items.dart';
import '../../view_models/search_events.dart';

class SearchProductsSection extends StatelessWidget {
  final SearchViewModel searchViewModel;

  const SearchProductsSection({super.key, required this.searchViewModel});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 16.h),
      itemCount: searchViewModel.state.productsList!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 17,
        crossAxisSpacing: 17,
        childAspectRatio: 163 / 240,
      ),
      itemBuilder: (context, index) {
        final product = searchViewModel.state.productsList![index];
        final productId = product.id ?? "";
        final cartState = searchViewModel.state.cartStates[productId];
        return CustomProductItems(
          productEntity: searchViewModel.state.productsList![index],
          cartState: cartState,
          onPressedButton: () {
            searchViewModel.doIntent(
              SearchAddToCartEvent(productId: productId),
            );
          },
        );
      },
    );
  }
}
