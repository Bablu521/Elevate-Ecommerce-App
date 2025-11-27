import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductItems extends StatelessWidget {
  final ProductEntity productEntity;
  final void Function()? onPressedButton;
  final BaseState? cartState;
  const CustomProductItems({
    super.key,
    required this.productEntity,
    this.onPressedButton,
    this.cartState,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        RouteNames.productDetails,
        arguments: productEntity,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.white[70]!, width: 0.5.w),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 147 / 131,
                child: CachedNetworkImage(
                  imageUrl: productEntity.imgCover ?? AppImages.productTestImage,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productEntity.title ?? local.product,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(fontSize: 12.sp),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              overflow: TextOverflow.ellipsis,
                              "${AppLocalizations.of(context).egp} ${productEntity.priceAfterDiscount.toString()}",
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              productEntity.price.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.gray,
                              ),
                            ),
                            Text(
                              "${(((productEntity.price ?? 0) - (productEntity.priceAfterDiscount ?? 0)) / (productEntity.price ?? 1) * 100).toInt()}%",
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: 36.h,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onPressedButton,
                  icon: (cartState?.isLoading ?? false)
                      ? null
                      : Icon(
                          cartState?.data == null
                              ? Icons.shopping_cart_outlined
                              : Icons.add_task_outlined,
                          size: 16.sp,
                        ),
                  label: (cartState?.isLoading ?? false)
                      ? SizedBox(
                          width: 16.sp,
                          height: 16.sp,
                          child: const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Text(
                          cartState?.data == null
                              ? local.addToCart
                              : local.added,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    backgroundColor: cartState?.data == null
                        ? theme.colorScheme.primary
                        : AppColors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
