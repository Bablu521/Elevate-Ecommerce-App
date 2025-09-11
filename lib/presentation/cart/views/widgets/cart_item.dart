import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_item_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/cart/view_models/cart_events.dart';
import 'package:elevate_ecommerce_app/presentation/cart/view_models/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final CartItemEntity cartItem;
  final CartViewModel cartViewModel;
  CartItem({super.key, required this.cartItem, required this.cartViewModel});

  late final product = cartItem.product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          border: Border.all(color: AppColors.gray, width: 0.5.w),
        ),
        child: Row(
          children: [
            Container(
              width: 96.w,
              height: 101.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: AppColors.lightPink,
                image: DecorationImage(
                  image: NetworkImage("${product!.imgCover}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product!.title ??
                                    AppLocalizations.of(context).productTitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                product!.description ??
                                    AppLocalizations.of(
                                      context,
                                    ).productDescription,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(
                                      fontSize: 13.sp,
                                      color: AppColors.gray,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15.w),
                        InkWell(
                          onTap: () {
                            cartViewModel.doIntent(
                              OnDeleteSpecificCartItemEvent(
                                productId: product?.id ?? '',
                              ),
                            );
                          },
                          child: Container(
                            width: 16.w,
                            height: 18.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.deleteIconImage),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "${AppLocalizations.of(context).eGP} ${product!.price}",
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    (cartItem.quantity != null &&
                                            cartItem.quantity! > 1)
                                        ? cartViewModel.doIntent(
                                            OnDecrementProductFromCartEvent(
                                              addProductToCartRequestEntity:
                                                  AddProductToCartRequestEntity(
                                                    product: product?.id ?? '',
                                                    quantity: -1,
                                                  ),
                                            ),
                                          )
                                        : null;
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "${cartItem.quantity}",
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 8.w),
                                InkWell(
                                  onTap: () {
                                    cartViewModel.doIntent(
                                      OnIncrementProductToCartEvent(
                                        addProductToCartRequestEntity:
                                            AddProductToCartRequestEntity(
                                              product: product?.id ?? '',
                                              quantity: 1,
                                            ),
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
