import 'package:elevate_ecommerce_app/presentation/product_details/view/widgets/button_add_cart.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/view/widgets/section_product_image_item.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/view/widgets/section_product_item_info.dart';
import 'package:flutter/material.dart';

import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SectionProductImageItem(items: productEntity.images ?? []),
            SectionProductItemInfo(productEntity: productEntity),
            ButtonAddCart(productID: productEntity.id),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
