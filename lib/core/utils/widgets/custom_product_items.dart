import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductItems extends StatelessWidget {
  final ProductEntity productEntity;
  const CustomProductItems({super.key, required this.productEntity});
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
              CachedNetworkImage(
                imageUrl: productEntity.imgCover ?? AppImages.productTestImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 131.h,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: Wrap(
                          children: [
                            Text(
                              overflow: TextOverflow.ellipsis,
                              "EGP ${productEntity.priceAfterDiscount.toString()}",
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
                              "${((productEntity.price ?? 0 - productEntity.priceAfterDiscount!) / productEntity.price!.toInt() * 100).toInt()}%",
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
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
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      RouteNames.productDetails,
                      arguments: productEntity,
                    );
                  },
                  icon: Icon(Icons.shopping_cart_outlined, size: 16.sp),
                  label: Text(
                    local.addToCart,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
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
