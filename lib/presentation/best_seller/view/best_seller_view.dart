import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/best_seller/view/widgets/best_seller_body.dart';
import 'package:flutter/material.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key, required this.listProduct});
  final List<ProductEntity> listProduct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).maybePop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).bestSeller,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              AppLocalizations.of(context).bloomWithOurExquisiteBestSellers,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 13,
                color: AppColors.gray,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: BestSellerBody(listProduct: listProduct),
    );
  }
}
