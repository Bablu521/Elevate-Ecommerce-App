import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/home/product_details/widgets/section_product_image_item.dart';
import 'package:elevate_ecommerce_app/presentation/home/product_details/widgets/section_product_item_info.dart';
import 'package:flutter/material.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key});

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SectionProductImageItem(),
            SectionProductItemInfo(),
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
