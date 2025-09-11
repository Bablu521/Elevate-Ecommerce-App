import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/widgets/section_product_image_item.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/widgets/section_product_item_info.dart';
import 'package:flutter/material.dart';

import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SectionProductImageItem(items: productEntity.images ?? []),
            SectionProductItemInfo(productEntity: productEntity),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(local.addToCart),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
