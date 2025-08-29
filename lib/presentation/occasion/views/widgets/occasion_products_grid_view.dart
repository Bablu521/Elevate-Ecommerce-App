import 'package:elevate_ecommerce_app/core/router/route_names.dart';
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
        childAspectRatio: 165 / 260,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(
              context,
            ).pushNamed(RouteNames.productDetails, arguments: products[index]);
          },
          child: CustomProductItems(productEntity: products[index]),
        );
      },
    );
  }
}
