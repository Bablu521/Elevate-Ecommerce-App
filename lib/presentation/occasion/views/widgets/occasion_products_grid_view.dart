import 'package:elevate_ecommerce_app/core/utils/widgets/custom_product_items.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:flutter/material.dart';

class OccasionProductsGridView extends StatelessWidget {
  final List<ProductEntity> products;
  const OccasionProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 17,
        crossAxisSpacing: 17,
        childAspectRatio: 160 / 260,
      ),
      itemBuilder: (context, index) {
        return CustomProductItems(productEntity: products[index]);
      },
    );
  }
}
