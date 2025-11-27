import 'package:elevate_ecommerce_app/core/utils/widgets/custom_product_items.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_events.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_states.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_view_model.dart';
import 'package:flutter/material.dart';

class OccasionProductsGridView extends StatelessWidget {
  final List<ProductEntity> products;
  final OccasionViewModel occasionViewModel;
  final OccasionStates state;
  const OccasionProductsGridView({
    super.key,
    required this.products,
    required this.occasionViewModel,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 17,
        crossAxisSpacing: 17,
        childAspectRatio: 163 / 240,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        final productId = product.id ?? "";
        final cartState = state.cartStates[productId];
        return CustomProductItems(
          productEntity: products[index],
          cartState: cartState,
          onPressedButton: () {
            occasionViewModel.doIntent(
              OccasionAddToCartEvent(productId: productId),
            );
          },
        );
      },
    );
  }
}
