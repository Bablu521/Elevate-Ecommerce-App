import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/views/widgets/occasion_products_grid_view.dart';
import 'package:flutter/material.dart';

class BestSellerBody extends StatelessWidget {
  const BestSellerBody({super.key, required this.listProduct});
  final List<ProductEntity> listProduct;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(child: OccasionProductsGridView(products: listProduct)),
        ],
      ),
    );
  }
}
